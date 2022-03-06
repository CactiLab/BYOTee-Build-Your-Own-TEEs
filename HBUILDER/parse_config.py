#!/usr/bin/env python3

import argparse
import json
import os
import textwrap


def parse_config_file(file_path):
    global configFile, TEE_config_list, board_info, project_info, peripheral_info, interrupt_info
    configFile = file_path

    with open(configFile) as jsonFile:
        data = json.load(jsonFile)
        temp = data['Enclaves']
        board_info = data['Board']
        project_info = data['Project']

        if 'Peripherals' in data:
            peripheral_info = data['Peripherals']

        if 'Interrupts' in data:
            interrupt_info = data['Interrupts']

        for key in temp:
            TEE_config_list.append(temp[key])

        print("Total TEEs : ", len(TEE_config_list))


def search_peripheral_by_type(peripheralNode, reqPeripheralType):
    temp = []

    for key in peripheralNode.keys():

        if peripheral_info[key]['Type'] == reqPeripheralType:
            temp.append(peripheral_info[key])

    return temp


def exclude_peripheral(excludedFrom, peripheralName):
    global tcl_file

    tcl_file.write(f'''
    # Exclude Address Segments
    exclude_bd_addr_seg [get_bd_addr_segs {excludedFrom}/Data/SEG_{peripheralName}_Reg]

    exclude_bd_addr_seg [get_bd_addr_segs {excludedFrom}/Instruction/SEG_{peripheralName}_Reg]
    ''')


def create_TEE_local_memory_cell(number, shared_bram_list):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Hierarchical cell: microblaze_{str(number)}_local_memory
    proc create_hier_cell_microblaze_{str(number)}_local_memory {{ parentCell nameHier }} {{
    variable script_folder	
    if {{ $parentCell eq "" || $nameHier eq "" }} {{	
    catch {{common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_{str(number)}_local_memory() - Empty argument(s)!"}}
    return	
    }}
    # Get object for parentCell	
    set parentObj [get_bd_cells $parentCell]	
    if {{ $parentObj == "" }} {{	
        catch {{common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}}	
        return	
    }}	
    # Make sure parentObj is hier blk	
    set parentType [get_property TYPE $parentObj]	
    if {{ $parentType ne "hier" }} {{	
        catch {{common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}}	
        return	
    }}
    # Save current instance; Restore later	
    set oldCurInst [current_bd_instance .]	
    # Set parent object as current	
    current_bd_instance $parentObj	
    # Create cell and set as current instance	
    set hier_obj [create_bd_cell -type hier $nameHier]	
    current_bd_instance $hier_obj	
    # Create interface pins	
    create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB	
    create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB	
    # Create pins	
    create_bd_pin -dir I -type clk LMB_Clk	
    create_bd_pin -dir I -type rst SYS_Rst	
    # Create instance: dlmb_bram_if_cntlr, and set properties	
    set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]	
    set_property -dict [ list \\
      CONFIG.C_ECC {{0}} \\
    ] $dlmb_bram_if_cntlr	
    # Create instance: dlmb_v10, and set properties	
    set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]	
    # Create instance: ilmb_bram_if_cntlr, and set properties	
    set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]	
    set_property -dict [ list \\
      CONFIG.C_ECC {{0}} \\
    ] $ilmb_bram_if_cntlr	
    # Create instance: ilmb_v10, and set properties	
    set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]	
    # Create instance: lmb_bram, and set properties	
    set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]	
    set_property -dict [ list \\
      CONFIG.Memory_Type {{True_Dual_Port_RAM}} \\
      CONFIG.use_bram_block {{BRAM_Controller}} \\
    ] $lmb_bram
    # Create interface connections	
    connect_bd_intf_net -intf_net microblaze_{str(number)}_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]	
    connect_bd_intf_net -intf_net microblaze_{str(number)}_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]	
    connect_bd_intf_net -intf_net microblaze_{str(number)}_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]	
    connect_bd_intf_net -intf_net microblaze_{str(number)}_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]	
    connect_bd_intf_net -intf_net microblaze_{str(number)}_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]	
    connect_bd_intf_net -intf_net microblaze_{str(number)}_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
    # Create port connections	
    connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]	
    connect_bd_net -net microblaze_{str(number)}_Clk [get_bd_pins LMB_Clk] {' '.join(['[get_bd_pins axi_bram_ctrl_' + str(i) + '/s_axi_aclk]' for i in range(len(shared_bram_list))])} [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]	
    # Restore current instance	
    current_bd_instance $oldCurInst	
    }}
    '''))


def create_TEE_Instances(number, dCache, iCache, processorImpl):
    global tcl_file
    global cache_tracker_list

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: microblaze_{str(number)}, and set properties
    set microblaze_{str(number)} [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_{str(number)} ]
    set_property -dict [ list \\
      CONFIG.C_ADDR_TAG_BITS {{16}} \\
      CONFIG.C_CACHE_BYTE_SIZE {{{iCache}}} \\
      CONFIG.C_DATA_SIZE {{{processorImpl}}} \\
      CONFIG.C_DCACHE_ADDR_TAG {{17}} \\
      CONFIG.C_DCACHE_BYTE_SIZE {{{dCache}}} \\
      CONFIG.C_DCACHE_LINE_LEN {{4}} \\
      CONFIG.C_DEBUG_ENABLED {{2}} \\
      CONFIG.C_D_AXI {{1}} \\
      CONFIG.C_D_LMB {{1}} \\
      CONFIG.C_ICACHE_LINE_LEN {{4}} \\
      CONFIG.C_ILL_OPCODE_EXCEPTION {{0}} \\
      CONFIG.C_I_AXI {{1}} \\
      CONFIG.C_I_LMB {{1}} \\
      CONFIG.C_M_AXI_D_BUS_EXCEPTION {{0}} \\
      CONFIG.C_RESET_MSR_ICE {{0}} \\
      CONFIG.C_UNALIGNED_EXCEPTIONS {{0}} \\
      CONFIG.C_USE_DCACHE {{{cache_tracker_list[number]['dCache']}}} \\
      CONFIG.C_USE_ICACHE {{{cache_tracker_list[number]['iCache']}}} \\
      CONFIG.G_USE_EXCEPTIONS {{0}} \\
    ] $microblaze_{str(number)}

    # Create instance: microblaze_{str(number)}_local_memory
    create_hier_cell_microblaze_{str(number)}_local_memory [current_bd_instance .] microblaze_{str(number)}_local_memory
    '''))


def create_MDM_block(size):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: mdm_0, and set properties
    set mdm_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_0 ]
    set_property -dict [ list \\
      CONFIG.C_ADDR_SIZE {{32}} \\
      CONFIG.C_MB_DBG_PORTS {{{str(size)}}} \\
      CONFIG.C_M_AXI_ADDR_WIDTH {{32}} \\
      CONFIG.C_USE_UART {{1}} \\
    ] $mdm_0
    '''))


def axi_connector_helper(portC_count):
    currentAxiName = ''

    if (portC_count < 10):
        currentAxiName = '0' + str(portC_count)
    else:
        currentAxiName = str(portC_count)

    return currentAxiName


def connecting_interface(number):
    global tcl_file, slave_axi_port_count, cache_tracker_list

    tcl_file.write(textwrap.dedent(f'''
    connect_bd_intf_net -intf_net microblaze_{str(number)}_M_AXI_DP [get_bd_intf_pins microblaze_{str(number)}/M_AXI_DP] [get_bd_intf_pins ps7_0_axi_periph/S{axi_connector_helper(slave_axi_port_count + 1)}_AXI]
    connect_bd_intf_net -intf_net microblaze_{str(number)}_M_AXI_IP [get_bd_intf_pins microblaze_{str(number)}/M_AXI_IP] [get_bd_intf_pins ps7_0_axi_periph/S{axi_connector_helper(slave_axi_port_count + 2)}_AXI]
    connect_bd_intf_net -intf_net microblaze_{str(number)}_debug [get_bd_intf_pins mdm_0/MBDEBUG_{str(number)}] [get_bd_intf_pins microblaze_{str(number)}/DEBUG]
    connect_bd_intf_net -intf_net microblaze_{str(number)}_dlmb_1 [get_bd_intf_pins microblaze_{str(number)}/DLMB] [get_bd_intf_pins microblaze_{str(number)}_local_memory/DLMB]
    connect_bd_intf_net -intf_net microblaze_{str(number)}_ilmb_1 [get_bd_intf_pins microblaze_{str(number)}/ILMB] [get_bd_intf_pins microblaze_{str(number)}_local_memory/ILMB]
    '''))

    slave_axi_port_count = slave_axi_port_count + 2

    if (cache_tracker_list[number]['dCache'] == 1):
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net microblaze_{str(number)}_M_AXI_DC [get_bd_intf_pins microblaze_{str(number)}/M_AXI_DC] [get_bd_intf_pins ps7_0_axi_periph/S{axi_connector_helper(slave_axi_port_count + 1)}_AXI]
        '''))
        slave_axi_port_count = slave_axi_port_count + 1

    if (cache_tracker_list[number]['iCache'] == 1):
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net microblaze_{str(number)}_M_AXI_IC [get_bd_intf_pins microblaze_{str(number)}/M_AXI_IC] [get_bd_intf_pins ps7_0_axi_periph/S{axi_connector_helper(slave_axi_port_count + 1)}_AXI]
        '''))
        slave_axi_port_count = slave_axi_port_count + 1


def set_clock_for_all(size, uart_size, shared_bram_list, interrupt_info_size):
    global tcl_file, axi_port_count, peripheral_info

    axi_dma_list = search_peripheral_by_type(peripheral_info, 'AXI_Direct_Memory_Access')
    clk_wizard_list = search_peripheral_by_type(peripheral_info, 'Clocking_Wizard')
    system_ila_list = search_peripheral_by_type(peripheral_info, 'System_ILA')
    xadc_wizard_list = search_peripheral_by_type(peripheral_info, 'XADC_Wizard')
    pwm_list = search_peripheral_by_type(peripheral_info, 'PWM')
    axis_data_fifo_list = search_peripheral_by_type(peripheral_info, 'AXI4_Stream_Data_FIFO')

    tcl_file.write(textwrap.dedent(f'''
    connect_bd_net -net microblaze_{str(size)}_Clk [get_bd_pins processing_system7_0/FCLK_CLK0] {' '.join(['[get_bd_pins axi_bram_ctrl_' + str(i) + '/s_axi_aclk]' for i in range(len(shared_bram_list))])} [get_bd_pins axi_gpio_0/s_axi_aclk] {' '.join(['[get_bd_pins axi_intc_' + str(i) + '/s_axi_aclk]' for i in range(interrupt_info_size)])} {' '.join(['[get_bd_pins axi_uartlite_' + str(i) + '/s_axi_aclk]' for i in range(uart_size)])} [get_bd_pins mdm_0/S_AXI_ACLK] {' '.join(['[get_bd_pins microblaze_' + str(r) + '/Clk] [get_bd_pins microblaze_' + str(r) + '_local_memory/LMB_Clk]' for r in range(size + 1)])} [get_bd_pins mb_axi_mem_interconnect_0/ACLK] {' '.join(['[get_bd_pins mb_axi_mem_interconnect_0/M' + str(i).zfill(2) + '_ACLK]' for i in range(axi_master_count)])} {' '.join(['[get_bd_pins mb_axi_mem_interconnect_0/S' + axi_connector_helper(r) + '_ACLK]' for r in range(axi_port_count)])} [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] {' '.join(['[get_bd_pins ps7_0_axi_periph/M' + str(i).zfill(2) + '_ACLK]' for i in range(axi_master_count)])} {' '.join(['[get_bd_pins ps7_0_axi_periph/S' + axi_connector_helper(r) + '_ACLK]' for r in range(axi_port_count)])} [get_bd_pins rst_ps7_0_50M/slowest_sync_clk] {' '.join(['[get_bd_pins clk_wiz_' + str(i) + '/clk_in1]' for i in range(len(clk_wizard_list))])} {' '.join(['[get_bd_pins system_ila_' + str(i) + '/clk]' for i in range(len(system_ila_list))])} {' '.join(['[get_bd_pins xadc_wiz_' + str(i) + '/s_axi_aclk]' for i in range(len(xadc_wizard_list))])} {' '.join(['[get_bd_pins pwm_' + str(i) + '/pwm_axi_aclk]' for i in range(len(pwm_list))])} {' '.join(['[get_bd_pins axis_data_fifo_' + str(i) + '/s_axis_aclk]' for i in range(len(axis_data_fifo_list))])} {'[get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins dma_axi_bram_ctrl_1/s_axi_aclk] [get_bd_pins dma_axi_bram_ctrl_1/s_axi_aclk]' if len(axi_dma_list) >= 1 else ''}
    connect_bd_net -net rst_ps7_0_50M_bus_struct_reset [get_bd_pins rst_ps7_0_50M/bus_struct_reset] {' '.join(['[get_bd_pins microblaze_' + str(r) + '_local_memory/SYS_Rst]' for r in range(size + 1)])}
    connect_bd_net -net rst_ps7_0_50M_mb_reset [get_bd_pins rst_ps7_0_50M/mb_reset] {' '.join(['[get_bd_pins microblaze_' + str(r) + '/Reset]' for r in range(size + 1)])}
    connect_bd_net -net rst_ps7_0_50M_peripheral_aresetn [get_bd_pins rst_ps7_0_50M/peripheral_aresetn] {' '.join(['[get_bd_pins axi_bram_ctrl_' + str(i) + '/s_axi_aresetn]' for i in range(len(shared_bram_list))])} [get_bd_pins axi_gpio_0/s_axi_aresetn] {' '.join(['[get_bd_pins axi_intc_' + str(i) + '/s_axi_aresetn]' for i in range(interrupt_info_size)])} {' '.join(['[get_bd_pins axi_uartlite_' + str(i) + '/s_axi_aresetn]' for i in range(uart_size)])} [get_bd_pins mdm_0/S_AXI_ARESETN] [get_bd_pins mb_axi_mem_interconnect_0/ARESETN] {' '.join(['[get_bd_pins mb_axi_mem_interconnect_0/M' + str(i).zfill(2) + '_ARESETN]' for i in range(axi_master_count)])} {' '.join(['[get_bd_pins mb_axi_mem_interconnect_0/S' + axi_connector_helper(r) + '_ARESETN]' for r in range(axi_port_count)])} [get_bd_pins ps7_0_axi_periph/ARESETN] {' '.join(['[get_bd_pins ps7_0_axi_periph/M' + str(i).zfill(2) + '_ARESETN]' for i in range(axi_master_count)])} {' '.join(['[get_bd_pins ps7_0_axi_periph/S' + axi_connector_helper(r) + '_ARESETN]' for r in range(axi_port_count)])} {' '.join(['[get_bd_pins xadc_wiz_' + str(i) + '/s_axi_aresetn]' for i in range(len(xadc_wizard_list))])} {' '.join(['[get_bd_pins pwm_' + str(i) + '/pwm_axi_aresetn]' for i in range(len(pwm_list))])} {' '.join(['[get_bd_pins axis_data_fifo_' + str(i) + '/m_axis_aresetn]' for i in range(len(axis_data_fifo_list))])} {'[get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins dma_axi_bram_ctrl_1/s_axi_aresetn] [get_bd_pins dma_axi_bram_ctrl_1/s_axi_aresetn]' if len(axi_dma_list) >= 1 else ''}
    connect_bd_net -net rst_ps7_0_50M_interconnect_aresetn [get_bd_pins rst_ps7_0_50M/interconnect_aresetn] {' '.join(['[get_bd_pins axis_data_fifo_' + str(i) + '/s_axis_aresetn]' for i in range(len(axis_data_fifo_list))])}
    '''))


def create_MB_address_segment(number, uart_list, BRAM_size, shared_bram_list, interrupt_info):
    global tcl_file
    offset = '0x42C00000'

    for i in range(len(uart_list)):
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset {offset} [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs axi_uartlite_{i}/S_AXI/Reg] SEG_axi_uartlite_{i}_Reg
        create_bd_addr_seg -range 0x00010000 -offset {offset} [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs axi_uartlite_{i}/S_AXI/Reg] SEG_axi_uartlite_{i}_Reg
        '''))
        offset = str(hex(int(offset, 16) + 65536))
    if len(shared_bram_list) == 1:
        shared_memory_size = shared_bram_list[0]['Size'].replace('KB', '')
        shared_memory_size = hex(int(shared_memory_size) * 1024)
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range {shared_memory_size} -offset {shared_bram_list[0]['Base_Address']} [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
        create_bd_addr_seg -range {shared_memory_size} -offset {shared_bram_list[0]['Base_Address']} [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
        '''))

    axi_dma_list = search_peripheral_by_type(peripheral_info, 'AXI_Direct_Memory_Access')
    if len(axi_dma_list) >= 1:
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset 0x40400000 [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
        create_bd_addr_seg -range 0x00010000 -offset 0x40400000 [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
        '''))
        if number == 0:
            tcl_file.write(textwrap.dedent(f'''
            create_bd_addr_seg -range 0x00008000 -offset 0x40008000 [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs dma_axi_bram_ctrl_1/S_AXI/Mem0] SEG_dma_axi_bram_ctrl_1_Mem0
            '''))

    tcl_file.write(textwrap.dedent(f'''
    create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
    create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
    '''))

    memory_base = 0x41800000
    memory_step = 0x10000

    for i in range(len(interrupt_info)):
        memory_offset = memory_base + i * memory_step
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs axi_intc_{i}/S_AXI/Reg] SEG_axi_intc_{i}_Reg
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs axi_intc_{i}/S_AXI/Reg] SEG_axi_intc_{i}_Reg
        '''))
    memory_base += len(interrupt_info) * memory_step

    xadc_wizard_list = search_peripheral_by_type(peripheral_info, 'XADC_Wizard')
    for i in range(len(xadc_wizard_list)):
        memory_offset = memory_base + i * memory_step
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs xadc_wiz_{i}/s_axi_lite/Reg] SEG_xadc_wiz_{i}_Reg
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs xadc_wiz_{i}/s_axi_lite/Reg] SEG_xadc_wiz_{i}_Reg
        '''))
    memory_base += len(xadc_wizard_list) * memory_step

    pwm_list = search_peripheral_by_type(peripheral_info, 'PWM')
    for i in range(len(pwm_list)):
        memory_offset = memory_base + i * memory_step
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs pwm_{i}/PWM_AXI/PWM_AXI_reg] SEG_pwm_{i}_PWM_AXI_reg
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs pwm_{i}/PWM_AXI/PWM_AXI_reg] SEG_pwm_{i}_PWM_AXI_reg
        '''))
    memory_base += len(pwm_list) * memory_step

    tcl_file.write(textwrap.dedent(f'''
    create_bd_addr_seg -range {BRAM_size} -offset 0x00000000 [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs microblaze_{str(number)}_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
    create_bd_addr_seg -range {BRAM_size} -offset 0x00000000 [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs microblaze_{str(number)}_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
    create_bd_addr_seg -range 0x00001000 -offset 0x43400000 [get_bd_addr_spaces microblaze_{str(number)}/Data] [get_bd_addr_segs mdm_0/S_AXI/Reg] SEG_mdm_0_Reg
    create_bd_addr_seg -range 0x00001000 -offset 0x43400000 [get_bd_addr_spaces microblaze_{str(number)}/Instruction] [get_bd_addr_segs mdm_0/S_AXI/Reg] SEG_mdm_0_Reg
    '''))


def write_board_and_project_configurations(board_info, project_info):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    ################################################################
    # This is a generated script based on design: design_1
    #
    # Though there are limitations about the generated script,
    # the main purpose of this utility is to make learning
    # IP Integrator Tcl commands easier.
    ################################################################

    namespace eval _tcl {{
    proc get_script_folder {{}} {{
    set script_path [file normalize [info script]]
    set script_folder [file dirname $script_path]
    return $script_folder
    }}
    }}
    variable script_folder
    set script_folder [_tcl::get_script_folder]

    ################################################################
    # Check if script is running in correct Vivado version.
    ################################################################
    set scripts_vivado_version 2019.1
    set current_vivado_version [version -short]

    if {{ [string first $scripts_vivado_version $current_vivado_version] == -1 }} {{
    puts ""
    catch {{common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \\"Tools => Report => Report IP Status...\\", then run write_bd_tcl to create an updated script."}}

    return 1
    }}

    ################################################################
    # START
    ################################################################

    # To test this script, run the following commands from Vivado Tcl console:
    # source design_1_script.tcl

    # If there is no project opened, this script will create a
    # project, but make sure you do not have an existing project
    # <./myproj/project_1.xpr> in the current working folder.

    set list_projs [get_projects -quiet]
    if {{ $list_projs eq "" }} {{
    create_project {project_info['Name']} {project_info['Folder_Name']} -part {board_info['Part']}
    set_property BOARD_PART {board_info['Vendor']}:{board_info['Name']}:part0:{board_info['Version']} [current_project]
    }}


    # CHANGE DESIGN NAME HERE
    variable design_name
    set design_name design_1

    # If you do not already have an existing IP Integrator design open,
    # you can create a design using the following command:
    #    create_bd_design $design_name

    # Creating design if needed
    set errMsg ""
    set nRet 0

    set cur_design [current_bd_design -quiet]
    set list_cells [get_bd_cells -quiet]

    if {{ ${{design_name}} eq "" }} {{
    # USE CASES:
    #    1) Design_name not set

    set errMsg "Please set the variable <design_name> to a non-empty value."
    set nRet 1

    }} elseif {{ ${{cur_design}} ne "" && ${{list_cells}} eq "" }} {{
    # USE CASES:
    #    2): Current design opened AND is empty AND names same.
    #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
    #    4): Current design opened AND is empty AND names diff; design_name exists in project.

    if {{ $cur_design ne $design_name }} {{
        common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
        set design_name [get_property NAME $cur_design]
    }}
    common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

    }} elseif {{ ${{cur_design}} ne "" && $list_cells ne "" && $cur_design eq $design_name }} {{
    # USE CASES:
    #    5) Current design opened AND has components AND same names.

    set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
    set nRet 1
    }} elseif {{ [get_files -quiet ${{design_name}}.bd] ne "" }} {{
    # USE CASES: 
    #    6) Current opened design, has components, but diff names, design_name exists in project.
    #    7) No opened design, design_name exists in project.

    set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
    set nRet 2

    }} else {{
    # USE CASES:
    #    8) No opened design, design_name not in project.
    #    9) Current opened design, has components, but diff names, design_name not in project.

    common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

    create_bd_design $design_name

    common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
    current_bd_design $design_name

    }}

    common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \\"$design_name\\"."

    if {{ $nRet != 0 }} {{
    catch {{common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}}
    return $nRet
    }}

    ##################################################################
    # DESIGN PROCs
    ##################################################################
    '''))


def create_uart_interface_ports(uart_list):
    global tcl_file

    for i in range(len(uart_list)):

        if i == 0:
            tcl_file.write(textwrap.dedent(f'''
            set uart_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 uart_rtl ]
            '''))
        else:
            tcl_file.write(textwrap.dedent(f'''
            set uart_rtl_{str(i - 1)} [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 uart_rtl_{str(i - 1)} ]
            '''))


def create_block_memory_generator(shared_bram_list):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: blk_mem_gen_0, and set properties
    set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
    set_property -dict [ list \\
      CONFIG.Enable_B {{Always_Enabled}} \\
      CONFIG.Memory_Type {{{shared_bram_list[0]["Memory_type"]}}} \\
      CONFIG.Port_B_Clock {{100}} \\
      CONFIG.Port_B_Enable_Rate {{100}} \\
      CONFIG.Port_B_Write_Rate {{50}} \\
      CONFIG.Use_RSTB_Pin {{true}} \\
    ] $blk_mem_gen_0
    '''))


def create_axi_bram_controller_instance():
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: axi_bram_ctrl_0, and set properties
    set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
    set_property -dict [ list \\
      CONFIG.SINGLE_PORT_BRAM {{1}} \\
    ] $axi_bram_ctrl_0
    '''))


def create_axi_dma_instance(axi_dma_list):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: axi_dma_0, and set properties
    set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
    set_property -dict [ list \\
      CONFIG.c_include_mm2s {{1}} \\
      CONFIG.c_include_s2mm {{0}} \\
      CONFIG.c_include_sg {{0}} \\
      CONFIG.c_m_axi_mm2s_data_width {{{axi_dma_list[0]['M_AXI_MM2S_Data_Width']}}} \\
      CONFIG.c_m_axis_mm2s_tdata_width {{16}} \\
      CONFIG.c_mm2s_burst_size {{{axi_dma_list[0]['MM2S_Burst_Size']}}} \\
      CONFIG.c_sg_include_stscntrl_strm {{0}} \\
    ] $axi_dma_0
    
    # Create instance: dma_axi_bram_ctrl_1, and set properties
    set dma_axi_bram_ctrl_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 dma_axi_bram_ctrl_1 ]
    set_property -dict [ list \\
      CONFIG.DATA_WIDTH {{32}} \\
      CONFIG.ECC_TYPE {{Hamming}} \\
      CONFIG.SINGLE_PORT_BRAM {{1}} \\
    ] $dma_axi_bram_ctrl_1
    '''))


def create_gpio_instances():
    global tcl_file

    gpio_list = search_peripheral_by_type(peripheral_info, 'AXI_GPIO')
    if len(gpio_list) == 1:
        tcl_file.write(textwrap.dedent(f'''
        # Create ports
        # Create instance: axi_gpio_0, and set properties
        set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
        '''))

        gpio_instance = gpio_list[0]

        if 'Board_Interface' in gpio_instance:
            tcl_file.write(textwrap.dedent((f'''
            set_property -dict [ list \\
              CONFIG.GPIO_BOARD_INTERFACE {{btns_2bits}} \\
              CONFIG.USE_BOARD_FLOW {{true}} \\
            ] $axi_gpio_0
            ''')))
        else:
            tcl_file.write(textwrap.dedent((f'''
            set_property -dict [ list \\
              CONFIG.C_ALL_OUTPUTS {{1}} \\
              CONFIG.C_GPIO_WIDTH {{1}} \\
              CONFIG.C_INTERRUPT_PRESENT {{0}} \\
            ] $axi_gpio_0
            ''')))


def create_uart_lite_instance(uart_list):
    global tcl_file

    for i in range(len(uart_list)):
        uart_node = uart_list[i]
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: axi_uartlite_{i}, and set properties
        set axi_uartlite_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_{i} ]
        set_property -dict [ list \\
          CONFIG.C_BAUDRATE {{{uart_node['Baud_Rate']}}} \\
        ] $axi_uartlite_{i}
        '''))


def create_axi_interrupt_instance():
    global tcl_file, interrupt_info

    for i in range(len(interrupt_info)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: axi_intc_{i}, and set properties
        set axi_intc_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 axi_intc_{i} ]
        '''))


def create_clk_wizard_instance(clk_wizard_list):
    global tcl_file

    backslash = '\\'
    for i in range(len(clk_wizard_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: clk_wiz_{i}, and set properties
        set clk_wiz_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_{i} ]
        set_property -dict [ list \\
          CONFIG.CLKOUT1_JITTER {{448.322}} \\
          CONFIG.CLKOUT1_PHASE_ERROR {{335.207}} \\
          CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {{24.576}} \\
          CONFIG.CLKOUT2_JITTER {{783.134}} \\
          CONFIG.CLKOUT2_PHASE_ERROR {{565.323}} \\
          CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {{100.000}} \\
          {'CONFIG.CLKOUT2_USED {false} ' + backslash if not 'clk_out2' in clk_wizard_list[i] else backslash}
          CONFIG.CLKOUT3_JITTER {{783.134}} \\
          CONFIG.CLKOUT3_PHASE_ERROR {{565.323}} \\
          CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {{100.000}} \\
          CONFIG.CLKOUT3_REQUESTED_PHASE {{0.000}} \\
          {'CONFIG.CLKOUT3_USED {false} ' + backslash if not 'clk_out3' in clk_wizard_list[i] else backslash}
          CONFIG.MMCM_CLKFBOUT_MULT_F {{34.250}} \\
          CONFIG.MMCM_CLKOUT0_DIVIDE_F {{27.875}} \\
          CONFIG.MMCM_CLKOUT1_DIVIDE {{1}} \\
          CONFIG.MMCM_CLKOUT2_DIVIDE {{1}} \\
          CONFIG.MMCM_CLKOUT2_PHASE {{0.000}} \\
          CONFIG.MMCM_DIVCLK_DIVIDE {{5}} \\
          CONFIG.NUM_OUT_CLKS {{1}} \\
        ] $clk_wiz_{i}
        '''))


def create_system_ila_instance(system_ila_list):
    global tcl_file

    backslash = '\\'
    newline = '\n'
    for i in range(len(system_ila_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: system_ila_{i}, and set properties
        set system_ila_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_{i} ]
        set_property -dict [ list \\
          CONFIG.C_MON_TYPE {{NATIVE}} \\
          CONFIG.C_NUM_OF_PROBES {{{system_ila_list[i]['Number_of_Probes']}}} \\
          {(' ' + backslash + newline + '          ').join(['CONFIG.C_PROBE0_TYPE {0}' for _ in range(int(system_ila_list[i]['Number_of_Probes']))])} \\
        ] $system_ila_{i}
        '''))


def create_constant_instance(constant_list):
    global tcl_file

    for i in range(len(constant_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: xlconstant_{i}, and set properties
        set xlconstant_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_{i} ]
        set_property -dict [ list \\
          CONFIG.CONST_VAL {{{constant_list[i]['Constant_Value']}}} \\
        ] $xlconstant_{i}
        '''))


def create_concat_instance(concat_list):
    global tcl_file

    for i in range(len(concat_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: xlconcat_2, and set properties
        set xlconcat_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_{i} ]
        set_property -dict [ list \\
          CONFIG.NUM_PORTS {{{concat_list[i]['Number_of_Ports']}}} \\
        ] $xlconcat_{i}
        '''))


def create_xadc_wizard_instance(xadc_wizard_list):
    global tcl_file

    for i in range(len(xadc_wizard_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: xadc_wiz_{i} and set properties
        set xadc_wiz_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 xadc_wiz_{i} ]
        set_property -dict [ list \\
          CONFIG.CHANNEL_ENABLE_CALIBRATION {{true}} \\
          CONFIG.CHANNEL_ENABLE_TEMPERATURE {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP0_VAUXN0 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP12_VAUXN12 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP13_VAUXN13 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP15_VAUXN15 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP1_VAUXN1 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP5_VAUXN5 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP6_VAUXN6 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP8_VAUXN8 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VAUXP9_VAUXN9 {{true}} \\
          CONFIG.CHANNEL_ENABLE_VBRAM {{true}} \\
          CONFIG.CHANNEL_ENABLE_VCCAUX {{true}} \\
          CONFIG.CHANNEL_ENABLE_VCCDDRO {{true}} \\
          CONFIG.CHANNEL_ENABLE_VCCINT {{true}} \\
          CONFIG.CHANNEL_ENABLE_VCCPAUX {{true}} \\
          CONFIG.CHANNEL_ENABLE_VCCPINT {{true}} \\
          CONFIG.CHANNEL_ENABLE_VP_VN {{true}} \\
          CONFIG.CHANNEL_ENABLE_VREFN {{true}} \\
          CONFIG.CHANNEL_ENABLE_VREFP {{true}} \\
          CONFIG.EXTERNAL_MUX_CHANNEL {{VP_VN}} \\
          CONFIG.SEQUENCER_MODE {{Continuous}} \\
          CONFIG.SINGLE_CHANNEL_SELECTION {{TEMPERATURE}} \\
          CONFIG.XADC_STARUP_SELECTION {{channel_sequencer}} \\
        ] $xadc_wiz_{i}
        '''))


def create_pwm_instance(pwm_list):
    global tcl_file

    for i in range(len(pwm_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: pwm_{i}, and set properties
        set pwm_{i} [ create_bd_cell -type ip -vlnv digilentinc.com:IP:PWM:2.0 pwm_{i} ]
        set_property -dict [ list \\
          CONFIG.NUM_PWM {{{pwm_list[i]['Number_of_PWM']}}} \\
        ] $pwm_{i}
        '''))


def create_axis_data_fifo_instance(axis_data_fifo_list):
    global tcl_file

    for i in range(len(axis_data_fifo_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: axis_data_fifo_{i}, and set properties
        set axis_data_fifo_{i} [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_{i} ]
        set_property -dict [ list \\
          CONFIG.ACLKEN_CONV_MODE {{0}} \\
          CONFIG.FIFO_DEPTH {{{axis_data_fifo_list[i]['FIFO_Depth']}}} \\
          CONFIG.IS_ACLK_ASYNC {{1}} \\
          CONFIG.TDATA_NUM_BYTES {{2}} \\
        ] $axis_data_fifo_{i}
        '''))


def create_i2s_output_instance(i2s_output_list):
    global tcl_file

    for i in range(len(i2s_output_list)):
        tcl_file.write(textwrap.dedent(f'''
        # Create instance: i2s_output_{i}, and set properties
        set block_name i2s_output
        set block_cell_name i2s_output_{i}
        if {{ [catch {{set i2s_output_{i} [create_bd_cell -type module -reference $block_name $block_cell_name] }} errmsg] }} {{
          catch {{common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${{block_name}}'s definition into the project."}}
          return 1
        }} elseif {{ $i2s_output_{i} eq "" }} {{
          catch {{common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${{block_name}}'s definition into the project."}}
          return 1
        }}
        '''))


def write_root_design():
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Procedure to create entire design; Provide argument to make
    # procedure reusable. If parentCell is "", will use root.
    proc create_root_design {{ parentCell }} {{

    variable script_folder
    variable design_name

    if {{ $parentCell eq "" }} {{
        set parentCell [get_bd_cells /]
    }}

    # Get object for parentCell
    set parentObj [get_bd_cells $parentCell]
    if {{ $parentObj == "" }} {{
        catch {{common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}}
        return
    }}

    # Make sure parentObj is hier blk
    set parentType [get_property TYPE $parentObj]
    if {{ $parentType ne "hier" }} {{
        catch {{common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}}
        return
    }}

    # Save current instance; Restore later
    set oldCurInst [current_bd_instance .]

    # Set parent object as current
    current_bd_instance $parentObj


    # Create interface ports
    set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]

    set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
    '''))

    xadc_wizard_list = search_peripheral_by_type(peripheral_info, 'XADC_Wizard')
    for i in range(len(xadc_wizard_list)):
        tcl_file.write(textwrap.dedent(f'''
        set vaux0_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux0_{i} ]
        set vaux1_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux1_{i} ]
        set vaux5_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux5_{i} ]
        set vaux6_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux6_{i} ]
        set vaux8_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux8_{i} ]
        set vaux9_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux9_{i} ]
        set vaux12_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux12_{i} ]
        set vaux13_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux13_{i} ]
        set vaux15_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vaux15_{i} ]
        set vp_vn_{i} [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vp_vn_{i} ]
        '''))

    i2s_output_list = search_peripheral_by_type(peripheral_info, 'I2S_Output')
    for i in range(len(i2s_output_list)):
        tcl_file.write(textwrap.dedent(f'''
        set ja0_{i} [ create_bd_port -dir O ja0_{i} ]
        set ja1_{i} [ create_bd_port -dir O ja1_{i} ]
        set ja2_{i} [ create_bd_port -dir O ja2_{i} ]
        set ja3_{i} [ create_bd_port -dir O ja3_{i} ]
        '''))

    gpio_list = search_peripheral_by_type(peripheral_info, 'AXI_GPIO')
    if len(gpio_list) == 1:
        gpio_instance = gpio_list[0]
        if 'Board_Interface' in gpio_instance:
            tcl_file.write(textwrap.dedent(f'''
            set btns_2bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 btns_2bits ]
            '''))


def ps_config_helper():
    global uart_list

    if len(uart_list) > 0:
        return 1

    return 0


def write_uart_properties(uart_list):
    global tcl_file

    for i in range(len(uart_list)):
        uart_node = uart_list[i]
        tcl_file.write(textwrap.indent(textwrap.dedent(f'''
        CONFIG.PCW_UART{i}_BAUD_RATE {{{uart_node['Baud_Rate']}}} \\
        CONFIG.PCW_UART{i}_GRP_FULL_ENABLE {{0}} \\
        CONFIG.PCW_UART{i}_PERIPHERAL_ENABLE {{1}} \\
        CONFIG.PCW_UART{i}_UART{i}_IO {{MIO 14 .. 15}} \\
        '''), '  ')[1:])

    tcl_file.write(textwrap.dedent(f'''
      CONFIG.PCW_UART_PERIPHERAL_CLKSRC {{IO PLL}} \\
      CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {{10}} \\
      CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {{100}} \\
      CONFIG.PCW_UART_PERIPHERAL_VALID {{1}} \\
      CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {{525.000000}} \\
      CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_AL {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {{3}} \\
      CONFIG.PCW_UIPARAM_DDR_BL {{8}} \\
      CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {{0.223}} \\
      CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {{0.212}} \\
      CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {{0.085}} \\
      CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {{0.092}} \\
      CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {{16 Bit}} \\
      CONFIG.PCW_UIPARAM_DDR_CL {{7}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {{15.8}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {{80.4535}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {{15.8}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {{80.4535}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {{80.4535}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {{80.4535}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {{10}} \\
      CONFIG.PCW_UIPARAM_DDR_CWL {{6}} \\
      CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {{4096 MBits}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {{15.6}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {{105.056}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {{18.8}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {{66.904}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {{89.1715}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {{113.63}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {{0.040}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {{0.058}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {{-0.009}} \\
      CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {{-0.033}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {{16.5}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {{98.503}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {{18}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {{68.5855}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {{90.295}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {{0}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {{103.977}} \\
      CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {{160}} \\
      CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {{16 Bits}} \\
      CONFIG.PCW_UIPARAM_DDR_ECC {{Disabled}} \\
      CONFIG.PCW_UIPARAM_DDR_ENABLE {{1}} \\
      CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {{525}} \\
      CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {{Normal (0-85)}} \\
      CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {{DDR 3}} \\
      CONFIG.PCW_UIPARAM_DDR_PARTNO {{MT41K256M16 RE-125}} \\
      CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {{15}} \\
      CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {{DDR3_1066F}} \\
      CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {{1}} \\
      CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {{1}} \\
      CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {{1}} \\
      CONFIG.PCW_UIPARAM_DDR_T_FAW {{40.0}} \\
      CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {{35.0}} \\
      CONFIG.PCW_UIPARAM_DDR_T_RC {{48.75}} \\
      CONFIG.PCW_UIPARAM_DDR_T_RCD {{7}} \\
      CONFIG.PCW_UIPARAM_DDR_T_RP {{7}} \\
      CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {{0}} \\
      CONFIG.PCW_USB0_PERIPHERAL_ENABLE {{1}} \\
      CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {{60}} \\
      CONFIG.PCW_USB0_RESET_ENABLE {{1}} \\
      CONFIG.PCW_USB0_RESET_IO {{MIO 46}} \\
      CONFIG.PCW_USB0_USB0_IO {{MIO 28 .. 39}} \\
      CONFIG.PCW_USB1_RESET_ENABLE {{0}} \\
      CONFIG.PCW_USB_RESET_ENABLE {{1}} \\
      CONFIG.PCW_USB_RESET_POLARITY {{Active Low}} \\
      CONFIG.PCW_USB_RESET_SELECT {{Share reset pin}} \\
      CONFIG.PCW_USE_AXI_NONSECURE {{0}} \\
      CONFIG.PCW_USE_CROSS_TRIGGER {{0}} \\
      CONFIG.PCW_USE_FABRIC_INTERRUPT {{{ps_config_helper()}}} \\
      CONFIG.PCW_USE_M_AXI_GP0 {{1}} \\
    ] $processing_system7_0
    ''')[1:])


def write_ps_config():
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: processing_system7_0, and set properties
    set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
    set_property -dict [ list \\
      CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {{650.000000}} \\
      CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {{10.096154}} \\
      CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {{125.000000}} \\
      CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {{50.000000}} \\
      CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {{200.000000}} \\
      CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {{100.000000}} \\
      CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {{10.000000}} \\
      CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {{200.000000}} \\
      CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {{108.333336}} \\
      CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {{108.333336}} \\
      CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {{108.333336}} \\
      CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {{108.333336}} \\
      CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {{108.333336}} \\
      CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {{108.333336}} \\
      CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {{100.000000}} \\
      CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {{108.333336}} \\
      CONFIG.PCW_APU_CLK_RATIO_ENABLE {{6:2:1}} \\
      CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {{650}} \\
      CONFIG.PCW_ARMPLL_CTRL_FBDIV {{26}} \\
      CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {{1}} \\
      CONFIG.PCW_CLK0_FREQ {{50000000}} \\
      CONFIG.PCW_CLK1_FREQ {{10000000}} \\
      CONFIG.PCW_CLK2_FREQ {{10000000}} \\
      CONFIG.PCW_CLK3_FREQ {{10000000}} \\
      CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE {{667}} \\
      CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {{1300.000}} \\
      CONFIG.PCW_CPU_PERIPHERAL_CLKSRC {{ARM PLL}} \\
      CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {{2}} \\
      CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {{50}} \\
      CONFIG.PCW_DCI_PERIPHERAL_CLKSRC {{DDR PLL}} \\
      CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {{52}} \\
      CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {{2}} \\
      CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ {{10.159}} \\
      CONFIG.PCW_DDRPLL_CTRL_FBDIV {{21}} \\
      CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {{1050.000}} \\
      CONFIG.PCW_DDR_HPRLPR_QUEUE_PARTITION {{HPR(0)/LPR(32)}} \\
      CONFIG.PCW_DDR_HPR_TO_CRITICAL_PRIORITY_LEVEL {{15}} \\
      CONFIG.PCW_DDR_LPR_TO_CRITICAL_PRIORITY_LEVEL {{2}} \\
      CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {{DDR PLL}} \\
      CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {{2}} \\
      CONFIG.PCW_DDR_PORT0_HPR_ENABLE {{0}} \\
      CONFIG.PCW_DDR_PORT1_HPR_ENABLE {{0}} \\
      CONFIG.PCW_DDR_PORT2_HPR_ENABLE {{0}} \\
      CONFIG.PCW_DDR_PORT3_HPR_ENABLE {{0}} \\
      CONFIG.PCW_DDR_RAM_BASEADDR {{0x00100000}} \\
      CONFIG.PCW_DDR_RAM_HIGHADDR {{0x1FFFFFFF}} \\
      CONFIG.PCW_DDR_WRITE_TO_CRITICAL_PRIORITY_LEVEL {{2}} \\
      CONFIG.PCW_ENET0_ENET0_IO {{MIO 16 .. 27}} \\
      CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {{1}} \\
      CONFIG.PCW_ENET0_GRP_MDIO_IO {{MIO 52 .. 53}} \\
      CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {{IO PLL}} \\
      CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {{8}} \\
      CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {{1}} \\
      CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {{1}} \\
      CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {{1000 Mbps}} \\
      CONFIG.PCW_ENET0_RESET_ENABLE {{1}} \\
      CONFIG.PCW_ENET0_RESET_IO {{MIO 9}} \\
      CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {{0}} \\
      CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {{IO PLL}} \\
      CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {{1}} \\
      CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {{0}} \\
      CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {{1000 Mbps}} \\
      CONFIG.PCW_ENET1_RESET_ENABLE {{0}} \\
      CONFIG.PCW_ENET_RESET_ENABLE {{1}} \\
      CONFIG.PCW_ENET_RESET_POLARITY {{Active Low}} \\
      CONFIG.PCW_ENET_RESET_SELECT {{Share reset pin}} \\
      CONFIG.PCW_EN_4K_TIMER {{0}} \\
      CONFIG.PCW_EN_EMIO_UART0 {{0}} \\
      CONFIG.PCW_EN_ENET0 {{1}} \\
      CONFIG.PCW_EN_GPIO {{1}} \\
      CONFIG.PCW_EN_SDIO0 {{1}} \\
      CONFIG.PCW_EN_UART0 {{1}} \\
      CONFIG.PCW_EN_USB0 {{1}} \\
      CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {{5}} \\
      CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {{4}} \\
      CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {{1}} \\
      CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {{1}} \\
      CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {{1}} \\
      CONFIG.PCW_FPGA_FCLK0_ENABLE {{1}} \\
      CONFIG.PCW_FPGA_FCLK1_ENABLE {{0}} \\
      CONFIG.PCW_FPGA_FCLK2_ENABLE {{0}} \\
      CONFIG.PCW_FPGA_FCLK3_ENABLE {{0}} \\
      CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {{1}} \\
      CONFIG.PCW_GPIO_MIO_GPIO_IO {{MIO}} \\
      CONFIG.PCW_GPIO_PERIPHERAL_ENABLE {{0}} \\
      CONFIG.PCW_I2C0_RESET_ENABLE {{0}} \\
      CONFIG.PCW_I2C1_RESET_ENABLE {{0}} \\
      CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {{25}} \\
      CONFIG.PCW_I2C_RESET_ENABLE {{1}} \\
      CONFIG.PCW_IOPLL_CTRL_FBDIV {{20}} \\
      CONFIG.PCW_IO_IO_PLL_FREQMHZ {{1000.000}} \\
      CONFIG.PCW_IRQ_F2P_INTR {{{ps_config_helper()}}} \\
      CONFIG.PCW_IRQ_F2P_MODE {{DIRECT}} \\
      CONFIG.PCW_MIO_0_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_0_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_0_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_0_SLEW {{slow}} \\
      CONFIG.PCW_MIO_10_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_10_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_10_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_10_SLEW {{slow}} \\
      CONFIG.PCW_MIO_11_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_11_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_11_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_11_SLEW {{slow}} \\
      CONFIG.PCW_MIO_12_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_12_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_12_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_12_SLEW {{slow}} \\
      CONFIG.PCW_MIO_13_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_13_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_13_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_13_SLEW {{slow}} \\
      CONFIG.PCW_MIO_14_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_14_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_14_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_14_SLEW {{slow}} \\
      CONFIG.PCW_MIO_15_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_15_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_15_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_15_SLEW {{slow}} \\
      CONFIG.PCW_MIO_16_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_16_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_16_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_16_SLEW {{slow}} \\
      CONFIG.PCW_MIO_17_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_17_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_17_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_17_SLEW {{slow}} \\
      CONFIG.PCW_MIO_18_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_18_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_18_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_18_SLEW {{slow}} \\
      CONFIG.PCW_MIO_19_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_19_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_19_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_19_SLEW {{slow}} \\
      CONFIG.PCW_MIO_1_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_1_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_1_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_1_SLEW {{slow}} \\
      CONFIG.PCW_MIO_20_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_20_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_20_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_20_SLEW {{slow}} \\
      CONFIG.PCW_MIO_21_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_21_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_21_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_21_SLEW {{slow}} \\
      CONFIG.PCW_MIO_22_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_22_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_22_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_22_SLEW {{slow}} \\
      CONFIG.PCW_MIO_23_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_23_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_23_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_23_SLEW {{slow}} \\
      CONFIG.PCW_MIO_24_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_24_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_24_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_24_SLEW {{slow}} \\
      CONFIG.PCW_MIO_25_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_25_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_25_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_25_SLEW {{slow}} \\
      CONFIG.PCW_MIO_26_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_26_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_26_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_26_SLEW {{slow}} \\
      CONFIG.PCW_MIO_27_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_27_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_27_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_27_SLEW {{slow}} \\
      CONFIG.PCW_MIO_28_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_28_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_28_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_28_SLEW {{slow}} \\
      CONFIG.PCW_MIO_29_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_29_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_29_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_29_SLEW {{slow}} \\
      CONFIG.PCW_MIO_2_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_2_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_2_PULLUP {{disabled}} \\
      CONFIG.PCW_MIO_2_SLEW {{slow}} \\
      CONFIG.PCW_MIO_30_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_30_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_30_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_30_SLEW {{slow}} \\
      CONFIG.PCW_MIO_31_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_31_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_31_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_31_SLEW {{slow}} \\
      CONFIG.PCW_MIO_32_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_32_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_32_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_32_SLEW {{slow}} \\
      CONFIG.PCW_MIO_33_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_33_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_33_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_33_SLEW {{slow}} \\
      CONFIG.PCW_MIO_34_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_34_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_34_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_34_SLEW {{slow}} \\
      CONFIG.PCW_MIO_35_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_35_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_35_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_35_SLEW {{slow}} \\
      CONFIG.PCW_MIO_36_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_36_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_36_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_36_SLEW {{slow}} \\
      CONFIG.PCW_MIO_37_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_37_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_37_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_37_SLEW {{slow}} \\
      CONFIG.PCW_MIO_38_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_38_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_38_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_38_SLEW {{slow}} \\
      CONFIG.PCW_MIO_39_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_39_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_39_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_39_SLEW {{slow}} \\
      CONFIG.PCW_MIO_3_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_3_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_3_PULLUP {{disabled}} \\
      CONFIG.PCW_MIO_3_SLEW {{slow}} \\
      CONFIG.PCW_MIO_40_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_40_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_40_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_40_SLEW {{slow}} \\
      CONFIG.PCW_MIO_41_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_41_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_41_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_41_SLEW {{slow}} \\
      CONFIG.PCW_MIO_42_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_42_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_42_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_42_SLEW {{slow}} \\
      CONFIG.PCW_MIO_43_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_43_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_43_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_43_SLEW {{slow}} \\
      CONFIG.PCW_MIO_44_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_44_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_44_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_44_SLEW {{slow}} \\
      CONFIG.PCW_MIO_45_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_45_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_45_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_45_SLEW {{slow}} \\
      CONFIG.PCW_MIO_46_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_46_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_46_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_46_SLEW {{slow}} \\
      CONFIG.PCW_MIO_47_DIRECTION {{in}} \\
      CONFIG.PCW_MIO_47_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_47_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_47_SLEW {{slow}} \\
      CONFIG.PCW_MIO_48_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_48_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_48_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_48_SLEW {{slow}} \\
      CONFIG.PCW_MIO_49_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_49_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_49_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_49_SLEW {{slow}} \\
      CONFIG.PCW_MIO_4_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_4_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_4_PULLUP {{disabled}} \\
      CONFIG.PCW_MIO_4_SLEW {{slow}} \\
      CONFIG.PCW_MIO_50_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_50_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_50_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_50_SLEW {{slow}} \\
      CONFIG.PCW_MIO_51_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_51_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_51_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_51_SLEW {{slow}} \\
      CONFIG.PCW_MIO_52_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_52_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_52_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_52_SLEW {{slow}} \\
      CONFIG.PCW_MIO_53_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_53_IOTYPE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_MIO_53_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_53_SLEW {{slow}} \\
      CONFIG.PCW_MIO_5_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_5_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_5_PULLUP {{disabled}} \\
      CONFIG.PCW_MIO_5_SLEW {{slow}} \\
      CONFIG.PCW_MIO_6_DIRECTION {{inout}} \\
      CONFIG.PCW_MIO_6_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_6_PULLUP {{disabled}} \\
      CONFIG.PCW_MIO_6_SLEW {{slow}} \\
      CONFIG.PCW_MIO_7_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_7_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_7_PULLUP {{disabled}} \\
      CONFIG.PCW_MIO_7_SLEW {{slow}} \\
      CONFIG.PCW_MIO_8_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_8_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_8_PULLUP {{disabled}} \\
      CONFIG.PCW_MIO_8_SLEW {{slow}} \\
      CONFIG.PCW_MIO_9_DIRECTION {{out}} \\
      CONFIG.PCW_MIO_9_IOTYPE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_MIO_9_PULLUP {{enabled}} \\
      CONFIG.PCW_MIO_9_SLEW {{slow}} \\
      CONFIG.PCW_MIO_TREE_PERIPHERALS {{GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#ENET Reset#GPIO#GPIO#GPIO#GPIO#UART 0#UART 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#USB Reset#SD 0#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0}} \\
      CONFIG.PCW_MIO_TREE_SIGNALS {{gpio[0]#gpio[1]#gpio[2]#gpio[3]#gpio[4]#gpio[5]#gpio[6]#gpio[7]#gpio[8]#reset#gpio[10]#gpio[11]#gpio[12]#gpio[13]#rx#tx#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#reset#cd#gpio[48]#gpio[49]#gpio[50]#gpio[51]#mdc#mdio}} \\
      CONFIG.PCW_OVERRIDE_BASIC_CLOCK {{0}} \\
      CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {{0.191}} \\
      CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {{0.181}} \\
      CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {{0.085}} \\
      CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {{0.092}} \\
      CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {{-0.023}} \\
      CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {{-0.005}} \\
      CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {{-0.009}} \\
      CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {{-0.033}} \\
      CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC {{IO PLL}} \\
      CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {{5}} \\
      CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ {{200}} \\
      CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {{0}} \\
      CONFIG.PCW_PLL_BYPASSMODE_ENABLE {{0}} \\
      CONFIG.PCW_PRESET_BANK0_VOLTAGE {{LVCMOS 3.3V}} \\
      CONFIG.PCW_PRESET_BANK1_VOLTAGE {{LVCMOS 1.8V}} \\
      CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {{0}} \\
      CONFIG.PCW_QSPI_GRP_IO1_ENABLE {{0}} \\
      CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {{0}} \\
      CONFIG.PCW_QSPI_GRP_SS1_ENABLE {{0}} \\
      CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC {{IO PLL}} \\
      CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {{0}} \\
      CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {{200}} \\
      CONFIG.PCW_SD0_GRP_CD_ENABLE {{1}} \\
      CONFIG.PCW_SD0_GRP_CD_IO {{MIO 47}} \\
      CONFIG.PCW_SD0_GRP_POW_ENABLE {{0}} \\
      CONFIG.PCW_SD0_GRP_WP_ENABLE {{0}} \\
      CONFIG.PCW_SD0_PERIPHERAL_ENABLE {{1}} \\
      CONFIG.PCW_SD0_SD0_IO {{MIO 40 .. 45}} \\
      CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC {{IO PLL}} \\
      CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {{10}} \\
      CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {{100}} \\
      CONFIG.PCW_SDIO_PERIPHERAL_VALID {{1}} \\
      CONFIG.PCW_SMC_PERIPHERAL_CLKSRC {{IO PLL}} \\
      CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_SMC_PERIPHERAL_FREQMHZ {{100}} \\
      CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC {{External}} \\
      CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {{1}} \\
      CONFIG.PCW_TPIU_PERIPHERAL_FREQMHZ {{200}} \\
    '''))


def write_ps_axi(slave_size, master_size):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: mb_axi_mem_interconnect_0, and set properties
    set mb_axi_mem_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 mb_axi_mem_interconnect_0 ]
    set_property -dict [ list \\
      CONFIG.NUM_MI {{{master_size}}} \\
      CONFIG.NUM_SI {{{slave_size}}} \\
    ] $mb_axi_mem_interconnect_0
    '''))

    tcl_file.write(textwrap.dedent(f'''
    # Create instance: ps7_0_axi_periph, and set properties
    set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
    set_property -dict [ list \\
      CONFIG.ENABLE_ADVANCED_OPTIONS {{1}} \\
      CONFIG.NUM_MI {{{master_size}}} \\
      CONFIG.NUM_SI {{{slave_size}}} \\
    ] $ps7_0_axi_periph

    # Create instance: rst_ps7_0_50M, and set properties
    set rst_ps7_0_50M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_50M ]
    '''))


def write_peripheral_interface_connection(uart_list, shared_bram_list):
    global tcl_file

    if len(shared_bram_list) == 1:
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
        '''))

    gpio_list = search_peripheral_by_type(peripheral_info, 'AXI_GPIO')
    if len(gpio_list) == 1:
        gpio_instance = gpio_list[0]
        if 'Board_Interface' in gpio_instance:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports btns_2bits] [get_bd_intf_pins axi_gpio_0/GPIO]
            '''))

    for i in range(len(uart_list)):
        if i == 0:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_intf_net -intf_net axi_uartlite_{i}_UART [get_bd_intf_ports uart_rtl] [get_bd_intf_pins axi_uartlite_{i}/UART]
            '''))
        else:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_intf_net -intf_net axi_uartlite_{i}_UART [get_bd_intf_ports uart_rtl_{i - 1}] [get_bd_intf_pins axi_uartlite_{i}/UART]
            '''))


def write_ps_interface_connections(axi_dma_list, uart_list, shared_bram_list, interrupt_info):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_pins processing_system7_0/DDR] [get_bd_intf_ports DDR]
    connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_pins processing_system7_0/FIXED_IO] [get_bd_intf_ports FIXED_IO]
    connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
    connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins ps7_0_axi_periph/M00_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
    connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins ps7_0_axi_periph/M01_AXI] [get_bd_intf_pins mdm_0/S_AXI]
    '''))

    m_value = 2

    if len(axi_dma_list) >= 1:
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net ps7_0_axi_periph_M{m_value:02}_AXI [get_bd_intf_pins ps7_0_axi_periph/M{m_value:02}_AXI] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
        '''))
        m_value += 1

    for i in range(len(uart_list)):
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net ps7_0_axi_periph_M{i + m_value:02}_AXI [get_bd_intf_pins ps7_0_axi_periph/M{i + m_value:02}_AXI] [get_bd_intf_pins axi_uartlite_{i}/S_AXI]
        '''))
    m_value += len(uart_list)

    for i in range(len(shared_bram_list)):
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net ps7_0_axi_periph_M{i + m_value:02}_AXI [get_bd_intf_pins ps7_0_axi_periph/M{i + m_value:02}_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]
        '''))
    m_value += len(shared_bram_list)

    for i in range(len(interrupt_info)):
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net ps7_0_axi_periph_M{i + m_value:02}_AXI [get_bd_intf_pins ps7_0_axi_periph/M{i + m_value:02}_AXI] [get_bd_intf_pins axi_intc_{i}/s_axi]
        '''))
    m_value += len(interrupt_info)

    xadc_wizard_list = search_peripheral_by_type(peripheral_info, 'XADC_Wizard')
    for i in range(len(xadc_wizard_list)):
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net ps7_0_axi_periph_M{i + m_value:02}_AXI [get_bd_intf_pins ps7_0_axi_periph/M{i + m_value:02}_AXI] [get_bd_intf_pins xadc_wiz_{i}/s_axi_lite]
        '''))
    m_value += len(xadc_wizard_list)

    pwm_list = search_peripheral_by_type(peripheral_info, 'PWM')
    for i in range(len(pwm_list)):
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net ps7_0_axi_periph_M{i + m_value:02}_AXI [get_bd_intf_pins ps7_0_axi_periph/M{i + m_value:02}_AXI] [get_bd_intf_pins pwm_{i}/PWM_AXI]
        '''))
    m_value += len(pwm_list)

    for interrupt in interrupt_info:
        interruptData = interrupt_info[interrupt]
        if 'Interrupt' in interruptData:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_intf_net -intf_net {interrupt}_interrupt [get_bd_intf_pins {interrupt}/interrupt] [get_bd_intf_pins {interruptData['Interrupt']}]
            '''))


def write_port_connections():
    global tcl_file, uart_list, interrupt_info

    # tcl_file.write(textwrap.dedent(f'''
    # connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins processing_system7_0/IRQ_F2P]
    # '''))

    axi_dma_list = search_peripheral_by_type(peripheral_info, 'AXI_Direct_Memory_Access')
    clk_wizard_list = search_peripheral_by_type(peripheral_info, 'Clocking_Wizard')
    constant_list = search_peripheral_by_type(peripheral_info, 'Constant')
    concat_list = search_peripheral_by_type(peripheral_info, 'Concat')
    xadc_wizard_list = search_peripheral_by_type(peripheral_info, 'XADC_Wizard')
    axis_data_fifo_list = search_peripheral_by_type(peripheral_info, 'AXI4_Stream_Data_FIFO')
    i2s_output_list = search_peripheral_by_type(peripheral_info, 'I2S_Output')

    if len(axi_dma_list) >= 1:
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins dma_axi_bram_ctrl_1/S_AXI]
        connect_bd_intf_net -intf_net dma_axi_bram_ctrl_1_BRAM_PORTA [get_bd_intf_pins dma_axi_bram_ctrl_1/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTB]
        '''))
        axi_dma_data = axi_dma_list[0]
        if 'M_AXIS_MM2S' in axi_dma_data:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins {axi_dma_data['M_AXIS_MM2S']}]
            '''))

    for i in range(len(uart_list)):
        uart_node = uart_list[i]

        if len(uart_node['Data_Transfer']) > 0:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_net -net axi_uartlite_{i}_tx [get_bd_pins axi_uartlite_{i}/rx] [get_bd_pins axi_uartlite_{i}/tx]
            '''))

    for interrupt in interrupt_info:
        interrupt_data = interrupt_info[interrupt]
        if 'Intr' in interrupt_data:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_net -net {interrupt}_intr [get_bd_pins {interrupt}/intr] [get_bd_pins {interrupt_data['Intr']}]
            '''))

    for i in range(len(clk_wizard_list)):
        clk_wizard_data = clk_wizard_list[i]
        for j in range(1, 4):
            if 'clk_out' + str(j) in clk_wizard_data:
                clk_out_list = get_list_from_obj_or_list(clk_wizard_data['clk_out' + str(j)])
                tcl_file.write(textwrap.dedent(f'''
                connect_bd_net -net clk_wiz_{i}_clk_out{j} [get_bd_pins clk_wiz_{i}/clk_out{j}] {' '.join(['[get_bd_pins ' + ele + ']' for ele in clk_out_list])}
                '''))

    for i in range(len(constant_list)):
        constant_data = constant_list[i]
        if 'dout' in constant_data:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_net -net xlconstant_{i}_dout [get_bd_pins xlconstant_{i}/dout] [get_bd_pins {constant_data['dout']}]
            '''))

    for i in range(len(concat_list)):
        concat_data = concat_list[i]
        if 'dout' in concat_data:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_net -net xlconcat_{i}_dout [get_bd_pins xlconcat_{i}/dout] [get_bd_pins {concat_data['dout']}]
            '''))

    for i in range(len(xadc_wizard_list)):
        xadc_wizard_data = xadc_wizard_list[i]
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux0 [get_bd_intf_pins xadc_wiz_{i}/Vaux0] [get_bd_intf_ports vaux0_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux1 [get_bd_intf_pins xadc_wiz_{i}/Vaux1] [get_bd_intf_ports vaux1_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux5 [get_bd_intf_pins xadc_wiz_{i}/Vaux5] [get_bd_intf_ports vaux5_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux6 [get_bd_intf_pins xadc_wiz_{i}/Vaux6] [get_bd_intf_ports vaux6_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux8 [get_bd_intf_pins xadc_wiz_{i}/Vaux8] [get_bd_intf_ports vaux8_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux9 [get_bd_intf_pins xadc_wiz_{i}/Vaux9] [get_bd_intf_ports vaux9_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux12 [get_bd_intf_pins xadc_wiz_{i}/Vaux12] [get_bd_intf_ports vaux12_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux13 [get_bd_intf_pins xadc_wiz_{i}/Vaux13] [get_bd_intf_ports vaux13_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vaux15 [get_bd_intf_pins xadc_wiz_{i}/Vaux15] [get_bd_intf_ports vaux15_{i}]
        connect_bd_intf_net -intf_net xadc_wiz_{i}_Vp_Vn [get_bd_intf_pins xadc_wiz_{i}/Vp_Vn] [get_bd_intf_ports vp_vn_{i}]
        '''))
        if 'ip2intc_irpt' in xadc_wizard_data:
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_net -net xadc_wiz_{i}_ip2intc_irpt [get_bd_pins xadc_wiz_{i}/ip2intc_irpt] [get_bd_pins {xadc_wizard_data['ip2intc_irpt']}]
            '''))

    for i in range(len(axis_data_fifo_list)):
        axis_data_fifo_data = axis_data_fifo_list[i]
        if 'm_axis_tdata' in axis_data_fifo_data:
            m_axis_tdata_list = get_list_from_obj_or_list(axis_data_fifo_data['m_axis_tdata'])
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_net -net axis_data_fifo_{i}_m_axis_tdata [get_bd_pins axis_data_fifo_{i}/m_axis_tdata] {' '.join(['[get_bd_pins ' + ele + ']' for ele in m_axis_tdata_list])}
            '''))

    for i in range(len(i2s_output_list)):
        i2s_output_data = i2s_output_list[i]
        if 'data_accepted' in i2s_output_data:
            data_accepted_list = get_list_from_obj_or_list(i2s_output_data['data_accepted'])
            tcl_file.write(textwrap.dedent(f'''
            connect_bd_net -net i2s_output_{i}_data_accepted [get_bd_pins i2s_output_{i}/data_accepted] {' '.join(['[get_bd_pins ' + ele + ']' for ele in data_accepted_list])}
            '''))
        i2s_sd_list = []
        if 'i2s_sd' in i2s_output_data:
            i2s_sd_list = get_list_from_obj_or_list(i2s_output_data['i2s_sd'])
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_net -net i2s_output_{i}_i2s_sd [get_bd_pins i2s_output_{i}/i2s_sd] [get_bd_ports ja0_{i}] {' '.join(['[get_bd_pins ' + ele + ']' for ele in i2s_sd_list])}
        '''))
        i2s_lrclk_list = []
        if 'i2s_lrclk' in i2s_output_data:
            i2s_lrclk_list = get_list_from_obj_or_list(i2s_output_data['i2s_lrclk'])
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_net -net i2s_output_{i}_i2s_sd [get_bd_pins i2s_output_{i}/i2s_lrclk] [get_bd_ports ja1_{i}] {' '.join(['[get_bd_pins ' + ele + ']' for ele in i2s_lrclk_list])}
        '''))
        i2s_sclk_list = []
        if 'i2s_sclk' in i2s_output_data:
            i2s_sclk_list = get_list_from_obj_or_list(i2s_output_data['i2s_sclk'])
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_net -net i2s_output_{i}_i2s_sd [get_bd_pins i2s_output_{i}/i2s_sclk] [get_bd_ports ja2_{i}] {' '.join(['[get_bd_pins ' + ele + ']' for ele in i2s_sclk_list])}
        '''))
        i2s_mclk_list = []
        if 'i2s_mclk' in i2s_output_data:
            i2s_mclk_list = get_list_from_obj_or_list(i2s_output_data['i2s_mclk'])
        tcl_file.write(textwrap.dedent(f'''
        connect_bd_net -net i2s_output_{i}_i2s_sd [get_bd_pins i2s_output_{i}/i2s_mclk] [get_bd_ports ja3_{i}] {' '.join(['[get_bd_pins ' + ele + ']' for ele in i2s_mclk_list])}
        '''))

    tcl_file.write(textwrap.dedent(f'''
    connect_bd_net -net mdm_0_debug_sys_rst [get_bd_pins mdm_0/Debug_SYS_Rst] [get_bd_pins rst_ps7_0_50M/mb_debug_sys_rst] {' '.join(['[get_bd_pins clk_wiz_' + str(i) + '/reset]' for i in range(len(clk_wizard_list))])}
    connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_50M/ext_reset_in]
    '''))


def write_ps_address_segment(uart_size, shared_bram_list, interrupt_info):
    global tcl_file

    if len(shared_bram_list) == 1:
        sharedMemorySize = shared_bram_list[0]['Size'].replace('KB', '')
        sharedMemorySize = hex(int(sharedMemorySize) * 1024)
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range {sharedMemorySize} -offset {shared_bram_list[0]['Base_Address']} [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
        '''))

    axi_dma_list = search_peripheral_by_type(peripheral_info, 'AXI_Direct_Memory_Access')
    if len(axi_dma_list) >= 1:
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset 0x40400000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
        '''))

    tcl_file.write(textwrap.dedent(f'''
    create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
    create_bd_addr_seg -range 0x00001000 -offset 0x43400000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs mdm_0/S_AXI/Reg] SEG_mdm_0_Reg
    '''))

    memory_base = 0x41800000
    memory_step = 0x10000

    for i in range(len(interrupt_info)):
        memory_offset = memory_base + i * memory_step
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_intc_{i}/S_AXI/Reg] SEG_axi_intc_{i}_Reg
        '''))

    memory_base = memory_base + len(interrupt_info) * memory_step

    xadc_wizard_list = search_peripheral_by_type(peripheral_info, 'XADC_Wizard')

    for i in range(len(xadc_wizard_list)):
        memory_offset = memory_base + i * memory_step
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset {memory_offset : #0{10}X} [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs xadc_wiz_{i}/s_axi_lite/Reg] SEG_xadc_wiz_{i}_Reg
        '''))

    offset = '0x42C00000'

    for i in range(uart_size):
        tcl_file.write(textwrap.dedent(f'''
        create_bd_addr_seg -range 0x00010000 -offset {offset} [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_uartlite_{i}/S_AXI/Reg] SEG_axi_uartlite_{i}_Reg
        '''))
        offset = str(hex(int(offset, 16) + 65536))


def write_synthesis_implementation_bitStream_properties(board_info, project_info):
    global tcl_file

    tcl_file.write(textwrap.dedent(f'''
    # Restore current instance
    current_bd_instance $oldCurInst

    validate_bd_design
    save_bd_design
    }}
    # End of create_root_design()


    ##################################################################
    # MAIN FLOW
    ##################################################################

    create_root_design ""

    set origin_dir "."

    # Set 'sources_1' fileset file properties for local files
    set file "design_1/design_1.bd"
    set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
    set_property -name "registered_with_manager" -value "1" -objects $file_obj


    # Set 'sources_1' fileset properties
    set obj [get_filesets sources_1]
    set_property -name "top" -value "design_1_wrapper" -objects $obj

    # Create 'constrs_1' fileset (if not found)
    if {{[string equal [get_filesets -quiet constrs_1] ""]}} {{
    create_fileset -constrset constrs_1
    }}

    # Set 'constrs_1' fileset object
    set obj [get_filesets constrs_1]

    # Empty (no sources present)

    # Set 'constrs_1' fileset properties
    set obj [get_filesets constrs_1]

    # Create 'sim_1' fileset (if not found)
    if {{[string equal [get_filesets -quiet sim_1] ""]}} {{
    create_fileset -simset sim_1
    }}

    # Set 'sim_1' fileset object
    set obj [get_filesets sim_1]
    # Empty (no sources present)

    # Set 'sim_1' fileset properties
    set obj [get_filesets sim_1]
    set_property -name "top" -value "design_1_wrapper" -objects $obj
    set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

    # Set 'utils_1' fileset object
    set obj [get_filesets utils_1]
    set files [list \\
    [file normalize "{project_info['Location']}tes.tcl"] \\
    ]
    add_files -norecurse -fileset $obj $files

    # Set 'utils_1' fileset file properties for remote files
    set file "{project_info['Location']}tes.tcl"
    set file [file normalize $file]
    set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
    set_property -name "file_type" -value "TCL" -objects $file_obj


    # Set 'utils_1' fileset file properties for local files
    # None

    # Set 'utils_1' fileset properties
    set obj [get_filesets utils_1]

    # Create 'synth_1' run (if not found)
    if {{[string equal [get_runs -quiet synth_1] ""]}} {{
        create_run -name synth_1 -part {board_info['Part']} -flow {{Vivado Synthesis 2019}} -strategy "Vivado Synthesis Defaults" -report_strategy {{No Reports}} -constrset constrs_1
    }} else {{
    set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
    set_property flow "Vivado Synthesis 2019" [get_runs synth_1]
    }}
    set obj [get_runs synth_1]
    set_property set_report_strategy_name 1 $obj
    set_property report_strategy {{Vivado Synthesis Default Reports}} $obj
    set_property set_report_strategy_name 0 $obj
    # Create 'synth_1_synth_report_utilization_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] }} {{
    create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
    }}
    set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
    if {{ $obj != "" }} {{

    }}
    set obj [get_runs synth_1]
    set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

    # set the current synth run
    current_run -synthesis [get_runs synth_1]

    # Create 'impl_1' run (if not found)
    if {{[string equal [get_runs -quiet impl_1] ""]}} {{
        create_run -name impl_1 -part {board_info['Part']} -flow {{Vivado Implementation 2019}} -strategy "Vivado Implementation Defaults" -report_strategy {{No Reports}} -constrset constrs_1 -parent_run synth_1
    }} else {{
    set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
    set_property flow "Vivado Implementation 2019" [get_runs impl_1]
    }}
    set obj [get_runs impl_1]
    set_property set_report_strategy_name 1 $obj
    set_property report_strategy {{Vivado Implementation Default Reports}} $obj
    set_property set_report_strategy_name 0 $obj
    # Create 'impl_1_init_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj
    set_property -name "options.max_paths" -value "10" -objects $obj

    }}
    # Create 'impl_1_opt_report_drc_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] }} {{
    create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_opt_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj
    set_property -name "options.max_paths" -value "10" -objects $obj

    }}
    # Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj
    set_property -name "options.max_paths" -value "10" -objects $obj

    }}
    # Create 'impl_1_place_report_io_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] }} {{
    create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_place_report_utilization_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] }} {{
    create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_place_report_control_sets_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] }} {{
    create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
    if {{ $obj != "" }} {{
    set_property -name "options.verbose" -value "1" -objects $obj

    }}
    # Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] }} {{
    create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj

    }}
    # Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] }} {{
    create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj

    }}
    # Create 'impl_1_place_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj
    set_property -name "options.max_paths" -value "10" -objects $obj

    }}
    # Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj
    set_property -name "options.max_paths" -value "10" -objects $obj

    }}
    # Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "is_enabled" -value "0" -objects $obj
    set_property -name "options.max_paths" -value "10" -objects $obj

    }}
    # Create 'impl_1_route_report_drc_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_route_report_methodology_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_route_report_power_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_route_report_route_status_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_route_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "options.max_paths" -value "10" -objects $obj

    }}
    # Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_route_report_clock_utilization_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
    if {{ $obj != "" }} {{

    }}
    # Create 'impl_1_route_report_bus_skew_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] }} {{
    create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
    if {{ $obj != "" }} {{
    set_property -name "options.warn_on_violation" -value "1" -objects $obj

    }}
    # Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] }} {{
    create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
    if {{ $obj != "" }} {{
    set_property -name "options.max_paths" -value "10" -objects $obj
    set_property -name "options.warn_on_violation" -value "1" -objects $obj

    }}
    # Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
    if {{ [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] }} {{
    create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
    }}
    set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
    if {{ $obj != "" }} {{
    set_property -name "options.warn_on_violation" -value "1" -objects $obj

    }}
    set obj [get_runs impl_1]
    set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
    set_property -name "steps.write_bitstream.tcl.pre" -value "[file normalize "$origin_dir/tes.tcl"]" -objects $obj
    set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
    set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

    # set the current impl run
    current_run -implementation [get_runs impl_1]

    puts "INFO: Project created:project_1"
    # Create 'drc_1' gadget (if not found)
    if {{[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]}} {{
    create_dashboard_gadget -name {{drc_1}} -type drc
    }}
    set obj [get_dashboard_gadgets [ list "drc_1" ] ]
    set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj

    # Create 'methodology_1' gadget (if not found)
    if {{[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]}} {{
    create_dashboard_gadget -name {{methodology_1}} -type methodology
    }}
    set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
    set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj

    # Create 'power_1' gadget (if not found)
    if {{[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]}} {{
    create_dashboard_gadget -name {{power_1}} -type power
    }}
    set obj [get_dashboard_gadgets [ list "power_1" ] ]
    set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj

    # Create 'timing_1' gadget (if not found)
    if {{[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]}} {{
    create_dashboard_gadget -name {{timing_1}} -type timing
    }}
    set obj [get_dashboard_gadgets [ list "timing_1" ] ]
    set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj

    # Create 'utilization_1' gadget (if not found)
    if {{[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]}} {{
    create_dashboard_gadget -name {{utilization_1}} -type utilization
    }}
    set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
    set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
    set_property -name "run.step" -value "synth_design" -objects $obj
    set_property -name "run.type" -value "synthesis" -objects $obj

    # Create 'utilization_2' gadget (if not found)
    if {{[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]}} {{
    create_dashboard_gadget -name {{utilization_2}} -type utilization
    }}
    set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
    set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj

    move_dashboard_gadget -name {{utilization_1}} -row 0 -col 0
    move_dashboard_gadget -name {{power_1}} -row 1 -col 0
    move_dashboard_gadget -name {{drc_1}} -row 2 -col 0
    move_dashboard_gadget -name {{timing_1}} -row 0 -col 1
    move_dashboard_gadget -name {{utilization_2}} -row 1 -col 1
    move_dashboard_gadget -name {{methodology_1}} -row 2 -col 1

    make_wrapper -files [get_files "{project_info['Location']}{project_info['Folder_Name']}/{project_info['Name']}.srcs/sources_1/bd/design_1/design_1.bd"] -top
    add_files -norecurse "{project_info['Location']}{project_info['Folder_Name']}/{project_info['Name']}.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v"
    '''))


def suppress_warnings():
    global project_info

    try:
        warn = open(os.path.join(project_info['Location'], "tes.tcl"), "a+")
    except Exception as e:
        print("Unable to open secrets file: {e}".format(e=e))
    warn.write(textwrap.dedent(f'''
    set_property SEVERITY {{Warning}} [get_drc_checks NSTD-1]
    set_property SEVERITY {{Warning}} [get_drc_checks UCIO-1]
    '''))

    warn.close()


def open_TCL_file_to_write():
    global tcl_file
    print(
        "Opening TCL file to create system hardware design at location : " + project_info['Location'] + "design_bd.tcl")

    try:
        tcl_file = open(os.path.join(project_info['Location'], "design_bd.tcl"), "a+")
    except Exception as e:
        print("Unable to open secrets file: {e}".format(e=e))


def print_uart_config(peripheral_info):
    global uart_list

    for key in peripheral_info.keys():

        if peripheral_info[key]['Type'] == 'UART_Lite':
            print(key + "-> peripheral can be accessed thorugh processors:")

            for processorsName in peripheral_info[key]['Data_Transfer'].keys():

                if (peripheral_info[key]['Data_Transfer'][processorsName] == 'True'):
                    print("\t" + processorsName)


def get_list_from_obj_or_list(obj_or_list):
    if type(obj_or_list) is not list:
        return [obj_or_list]
    return obj_or_list


def main():
    parser = argparse.ArgumentParser(description="""
    Parse config requires the following:
    directory to the hardware configuration file
    """, formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument("-d", "--config_path", required=True, help="Path to configuration json")
    args = parser.parse_args()
    parse_config_file(args.config_path)
    suppress_warnings()
    global tcl_file, uart_list, axi_port_count, axi_master_count, interrupt_info

    if os.path.exists(project_info['Location'] + "/design_bd.tcl"):
        os.remove(project_info['Location'] + "/design_bd.tcl")

    open_TCL_file_to_write()
    write_board_and_project_configurations(board_info, project_info)

    shared_bram_list = search_peripheral_by_type(peripheral_info, 'Block_RAM_Generator')
    axi_dma_list = search_peripheral_by_type(peripheral_info, 'AXI_Direct_Memory_Access')
    uart_list = search_peripheral_by_type(peripheral_info, 'UART_Lite')
    clk_wizard_list = search_peripheral_by_type(peripheral_info, 'Clocking_Wizard')
    system_ila_list = search_peripheral_by_type(peripheral_info, 'System_ILA')
    constant_list = search_peripheral_by_type(peripheral_info, 'Constant')
    concat_list = search_peripheral_by_type(peripheral_info, 'Concat')
    xadc_wizard_list = search_peripheral_by_type(peripheral_info, 'XADC_Wizard')
    pwm_list = search_peripheral_by_type(peripheral_info, 'PWM')
    axis_data_fifo_list = search_peripheral_by_type(peripheral_info, 'AXI4_Stream_Data_FIFO')
    i2s_output_list = search_peripheral_by_type(peripheral_info, 'I2S_Output')

    if len(shared_bram_list) >= 1:
        create_block_memory_generator(shared_bram_list)
        create_axi_bram_controller_instance()

    for i in range(len(TEE_config_list)):
        create_TEE_local_memory_cell(i, shared_bram_list)

    axi_master_count = 2

    if len(axi_dma_list) >= 1:
        create_axi_dma_instance(axi_dma_list)
        axi_master_count += 2

    write_root_design()

    create_uart_interface_ports(uart_list)
    create_gpio_instances()
    create_axi_interrupt_instance()
    create_uart_lite_instance(uart_list)
    create_clk_wizard_instance(clk_wizard_list)
    create_system_ila_instance(system_ila_list)
    create_constant_instance(constant_list)
    create_concat_instance(concat_list)
    create_xadc_wizard_instance(xadc_wizard_list)
    create_pwm_instance(pwm_list)
    create_axis_data_fifo_instance(axis_data_fifo_list)
    create_i2s_output_instance(i2s_output_list)

    create_MDM_block(len(TEE_config_list))

    axi_port_count = 4 * len(TEE_config_list) + 1
    axi_master_count += len(uart_list) + len(shared_bram_list) + len(interrupt_info) + len(xadc_wizard_list) + len(
        pwm_list)

    for i in range(len(TEE_config_list)):
        temp = {}
        temp['dCache'] = 1
        temp['iCache'] = 1
        dCache = TEE_config_list[i]['Cache_Configuration']['Data_cache']
        iCache = TEE_config_list[i]['Cache_Configuration']['Instruction_cache']
        processorImpl = int(TEE_config_list[i]['MicroBlaze_Implementation_bits'])

        if (dCache == ''):
            dCache = str(8)
            temp['dCache'] = 0
            axi_port_count = axi_port_count - 1

        if (iCache == ''):
            iCache = str(8)
            temp['iCache'] = 0
            axi_port_count = axi_port_count - 1
        cache_tracker_list.append(temp)
        create_TEE_Instances(i, int(dCache.replace('KB', '')) * 1024, int(iCache.replace('KB', '')) * 1024,
                             processorImpl)

    write_ps_config()
    write_uart_properties(uart_list)
    write_ps_axi(axi_port_count, axi_master_count)
    write_peripheral_interface_connection(uart_list, shared_bram_list)

    for i in range(len(TEE_config_list)):
        connecting_interface(i)

    write_ps_interface_connections(axi_dma_list, uart_list, shared_bram_list, interrupt_info)
    set_clock_for_all(len(TEE_config_list) - 1, len(uart_list), shared_bram_list, len(interrupt_info))
    write_port_connections()

    for i in range(len(TEE_config_list)):
        BRAM_Size = TEE_config_list[i]['Local_Memory']['Size']
        BRAM_Size = BRAM_Size.replace('KB', '')
        BRAM_Size = hex(int(BRAM_Size) * 1024)
        # print (BRAM_Size)
        create_MB_address_segment(i, uart_list, BRAM_Size, shared_bram_list, interrupt_info)

    write_ps_address_segment(len(uart_list), shared_bram_list, interrupt_info)

    for i in range(len(uart_list)):
        uart_node = uart_list[i]

        for key in uart_node['Data_Transfer']:
            # print(list(uart_node ['Data_Transfer'].keys()).index("REE"))
            processor_name = ''
            peripheral_name = 'axi_uartlite_0'

            if (key == 'REE'):
                processor_name = 'processing_system7_0'
            else:
                processor_name = 'microblaze_' + str(list(uart_node['Data_Transfer'].keys()).index(key) - 1)

            if (uart_node['Data_Transfer'][key] == 'False'):
                exclude_peripheral(processor_name, peripheral_name)

    write_synthesis_implementation_bitStream_properties(board_info, project_info)
    if hasattr(tcl_file, 'close'):
        tcl_file.close()
        print('TCL file is saved successfully.')
    print_uart_config(peripheral_info)


tcl_file = None

slave_axi_port_count = 0
number_of_TEE = 0
axi_port_count = 0
axi_master_count = 0

cache_tracker_list = []
TEE_config_list = []

board_info = {}
project_info = {}
peripheral_info = {}
interrupt_info = {}

uart_list = []

if __name__ == '__main__':
    main()
