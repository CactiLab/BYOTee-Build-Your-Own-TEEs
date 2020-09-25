#!/bin/bash
NEW_KEY="${1}"
RUN_DIR="${2}"
FILE="${RUN_DIR}/../pl/AES_IP/HLS_Decrypt/solution1/impl/ip/hdl/vhdl/decrypt_Key1.vhd"
TMP="/tmp/fart.vhd"
HEAD=28
TAIL=67

replace_AES_key() {
	# Arg check
	if [ -z ${NEW_KEY+x} ] || [ ${#NEW_KEY} -lt 2 ]
	then
		echo "USAGE: $0 <AES_KEY>"
		echo "Key must be 16 bytes! eg: $0 46415254504f4f50534849544655434b"
		return 1
	elif [ ${#NEW_KEY} -ne 32 ]
	then
		echo "INVALID KEY: ${NEW_KEY}"
		echo "Key must be 16 bytes! eg: 46415254504f4f50534849544655434b"
		return 1
	fi

	# Extra arg checks
	if [ ! -f ${FILE} ]
	then
		echo "ERROR! File does not exist: ${FILE}"
		return 1
	fi

	# Generate 'new_key_str' by parsing input string
	new_key_str=""
	byte=0
	for (( i=0; i<${#NEW_KEY}; i++ ))
	do
		c1="${NEW_KEY:$i:1}"
		let i++
		c2="${NEW_KEY:$i:1}"
		new_key_str+="${byte} => x\"${c1}${c2}\""
		[ ${byte} -ne 15 ] && new_key_str+=",\t"
		let byte++
		[ $(($byte % 4)) -eq 0 ] && new_key_str+="\n"
	done
	new_key_str+=");\n"

	# Create new file
	head -n $HEAD $FILE > $TMP
#	printf '
#     0 => x"46",   1 => x"41",  2 => x"52",  3 => x"54",
#     4 => x"50",   5 => x"4f",  6 => x"4f",  7 => x"50",
#     8 => x"53",   9 => x"48", 10 => x"49", 11 => x"54",
#    12 => x"46",  13 => x"55", 14 => x"43", 15 => x"4b" );
#' >> $TMP
	printf "${new_key_str}" >> $TMP
	tail -n $TAIL $FILE >> $TMP

	# Overwrite old file
	mv $TMP $FILE
}

replace_AES_key $@
