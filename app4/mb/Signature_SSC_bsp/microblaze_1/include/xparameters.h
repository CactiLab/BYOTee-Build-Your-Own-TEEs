#ifndef XPARAMETERS_H   /* prevent circular inclusions */
#define XPARAMETERS_H   /* by using protection macros */

/* Definitions for bus frequencies */
#define XPAR_CPU_M_AXI_DP_FREQ_HZ 1e+08
#define XPAR_CPU_M_AXI_IP_FREQ_HZ 1e+08
/******************************************************************/

/* Canonical definitions for bus frequencies */
#define XPAR_PROC_BUS_0_FREQ_HZ 1e+08
#define XPAR_PROC_BUS_1_FREQ_HZ 1e+08
/******************************************************************/

#define XPAR_CPU_CORE_CLOCK_FREQ_HZ 1e+08
#define XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ 1e+08

/******************************************************************/


/* Definitions for peripheral MICROBLAZE_1 */
#define XPAR_MICROBLAZE_1_ADDR_SIZE 32
#define XPAR_MICROBLAZE_1_ADDR_TAG_BITS 17
#define XPAR_MICROBLAZE_1_ALLOW_DCACHE_WR 1
#define XPAR_MICROBLAZE_1_ALLOW_ICACHE_WR 1
#define XPAR_MICROBLAZE_1_AREA_OPTIMIZED 0
#define XPAR_MICROBLAZE_1_ASYNC_INTERRUPT 1
#define XPAR_MICROBLAZE_1_ASYNC_WAKEUP 3
#define XPAR_MICROBLAZE_1_AVOID_PRIMITIVES 0
#define XPAR_MICROBLAZE_1_BASE_VECTORS 0x0000000000000000
#define XPAR_MICROBLAZE_1_BRANCH_TARGET_CACHE_SIZE 0
#define XPAR_MICROBLAZE_1_CACHE_BYTE_SIZE 8192
#define XPAR_MICROBLAZE_1_DADDR_SIZE 32
#define XPAR_MICROBLAZE_1_DATA_SIZE 32
#define XPAR_MICROBLAZE_1_DCACHE_ADDR_TAG 17
#define XPAR_MICROBLAZE_1_DCACHE_ALWAYS_USED 0
#define XPAR_MICROBLAZE_1_DCACHE_BASEADDR 0x00000000
#define XPAR_MICROBLAZE_1_DCACHE_BYTE_SIZE 8192
#define XPAR_MICROBLAZE_1_DCACHE_DATA_WIDTH 0
#define XPAR_MICROBLAZE_1_DCACHE_FORCE_TAG_LUTRAM 0
#define XPAR_MICROBLAZE_1_DCACHE_HIGHADDR 0x3FFFFFFF
#define XPAR_MICROBLAZE_1_DCACHE_LINE_LEN 4
#define XPAR_MICROBLAZE_1_DCACHE_USE_WRITEBACK 0
#define XPAR_MICROBLAZE_1_DCACHE_VICTIMS 0
#define XPAR_MICROBLAZE_1_DC_AXI_MON 0
#define XPAR_MICROBLAZE_1_DEBUG_COUNTER_WIDTH 32
#define XPAR_MICROBLAZE_1_DEBUG_ENABLED 2
#define XPAR_MICROBLAZE_1_DEBUG_EVENT_COUNTERS 5
#define XPAR_MICROBLAZE_1_DEBUG_EXTERNAL_TRACE 0
#define XPAR_MICROBLAZE_1_DEBUG_INTERFACE 0
#define XPAR_MICROBLAZE_1_DEBUG_LATENCY_COUNTERS 1
#define XPAR_MICROBLAZE_1_DEBUG_PROFILE_SIZE 0
#define XPAR_MICROBLAZE_1_DEBUG_TRACE_ASYNC_RESET 0
#define XPAR_MICROBLAZE_1_DEBUG_TRACE_SIZE 8192
#define XPAR_MICROBLAZE_1_DIV_ZERO_EXCEPTION 0
#define XPAR_MICROBLAZE_1_DP_AXI_MON 0
#define XPAR_MICROBLAZE_1_DYNAMIC_BUS_SIZING 0
#define XPAR_MICROBLAZE_1_D_AXI 1
#define XPAR_MICROBLAZE_1_D_LMB 1
#define XPAR_MICROBLAZE_1_D_LMB_MON 0
#define XPAR_MICROBLAZE_1_ECC_USE_CE_EXCEPTION 0
#define XPAR_MICROBLAZE_1_EDGE_IS_POSITIVE 1
#define XPAR_MICROBLAZE_1_ENABLE_DISCRETE_PORTS 0
#define XPAR_MICROBLAZE_1_ENDIANNESS 1
#define XPAR_MICROBLAZE_1_FAULT_TOLERANT 0
#define XPAR_MICROBLAZE_1_FPU_EXCEPTION 0
#define XPAR_MICROBLAZE_1_FREQ 100000000
#define XPAR_MICROBLAZE_1_FSL_EXCEPTION 0
#define XPAR_MICROBLAZE_1_FSL_LINKS 0
#define XPAR_MICROBLAZE_1_IADDR_SIZE 32
#define XPAR_MICROBLAZE_1_ICACHE_ALWAYS_USED 0
#define XPAR_MICROBLAZE_1_ICACHE_BASEADDR 0x00000000
#define XPAR_MICROBLAZE_1_ICACHE_DATA_WIDTH 0
#define XPAR_MICROBLAZE_1_ICACHE_FORCE_TAG_LUTRAM 0
#define XPAR_MICROBLAZE_1_ICACHE_HIGHADDR 0x3FFFFFFF
#define XPAR_MICROBLAZE_1_ICACHE_LINE_LEN 4
#define XPAR_MICROBLAZE_1_ICACHE_STREAMS 0
#define XPAR_MICROBLAZE_1_ICACHE_VICTIMS 0
#define XPAR_MICROBLAZE_1_IC_AXI_MON 0
#define XPAR_MICROBLAZE_1_ILL_OPCODE_EXCEPTION 0
#define XPAR_MICROBLAZE_1_IMPRECISE_EXCEPTIONS 0
#define XPAR_MICROBLAZE_1_INSTR_SIZE 32
#define XPAR_MICROBLAZE_1_INTERCONNECT 2
#define XPAR_MICROBLAZE_1_INTERRUPT_IS_EDGE 0
#define XPAR_MICROBLAZE_1_INTERRUPT_MON 0
#define XPAR_MICROBLAZE_1_IP_AXI_MON 0
#define XPAR_MICROBLAZE_1_I_AXI 1
#define XPAR_MICROBLAZE_1_I_LMB 1
#define XPAR_MICROBLAZE_1_I_LMB_MON 0
#define XPAR_MICROBLAZE_1_LOCKSTEP_MASTER 0
#define XPAR_MICROBLAZE_1_LOCKSTEP_SELECT 0
#define XPAR_MICROBLAZE_1_LOCKSTEP_SLAVE 0
#define XPAR_MICROBLAZE_1_M0_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M0_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M1_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M1_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M2_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M2_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M3_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M3_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M4_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M4_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M5_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M5_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M6_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M6_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M7_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M7_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M8_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M8_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M9_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M9_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M10_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M10_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M11_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M11_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M12_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M12_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M13_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M13_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M14_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M14_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_M15_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M15_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_MMU_DTLB_SIZE 4
#define XPAR_MICROBLAZE_1_MMU_ITLB_SIZE 2
#define XPAR_MICROBLAZE_1_MMU_PRIVILEGED_INSTR 0
#define XPAR_MICROBLAZE_1_MMU_TLB_ACCESS 3
#define XPAR_MICROBLAZE_1_MMU_ZONES 16
#define XPAR_MICROBLAZE_1_M_AXI_DC_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_DC_ARUSER_WIDTH 5
#define XPAR_MICROBLAZE_1_M_AXI_DC_AWUSER_WIDTH 5
#define XPAR_MICROBLAZE_1_M_AXI_DC_BUSER_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_DC_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_DC_EXCLUSIVE_ACCESS 0
#define XPAR_MICROBLAZE_1_M_AXI_DC_RUSER_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_DC_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_DC_USER_SIGNALS 0
#define XPAR_MICROBLAZE_1_M_AXI_DC_USER_VALUE 31
#define XPAR_MICROBLAZE_1_M_AXI_DC_WUSER_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_DP_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_DP_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_DP_EXCLUSIVE_ACCESS 0
#define XPAR_MICROBLAZE_1_M_AXI_DP_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_D_BUS_EXCEPTION 0
#define XPAR_MICROBLAZE_1_M_AXI_IC_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_IC_ARUSER_WIDTH 5
#define XPAR_MICROBLAZE_1_M_AXI_IC_AWUSER_WIDTH 5
#define XPAR_MICROBLAZE_1_M_AXI_IC_BUSER_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_IC_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_IC_RUSER_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_IC_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_IC_USER_SIGNALS 0
#define XPAR_MICROBLAZE_1_M_AXI_IC_USER_VALUE 31
#define XPAR_MICROBLAZE_1_M_AXI_IC_WUSER_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_IP_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_IP_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_M_AXI_IP_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_1_M_AXI_I_BUS_EXCEPTION 0
#define XPAR_MICROBLAZE_1_NUMBER_OF_PC_BRK 4
#define XPAR_MICROBLAZE_1_NUMBER_OF_RD_ADDR_BRK 2
#define XPAR_MICROBLAZE_1_NUMBER_OF_WR_ADDR_BRK 2
#define XPAR_MICROBLAZE_1_NUM_SYNC_FF_CLK 2
#define XPAR_MICROBLAZE_1_NUM_SYNC_FF_CLK_DEBUG 2
#define XPAR_MICROBLAZE_1_NUM_SYNC_FF_CLK_IRQ 1
#define XPAR_MICROBLAZE_1_NUM_SYNC_FF_DBG_CLK 1
#define XPAR_MICROBLAZE_1_NUM_SYNC_FF_DBG_TRACE_CLK 2
#define XPAR_MICROBLAZE_1_OPCODE_0X0_ILLEGAL 0
#define XPAR_MICROBLAZE_1_OPTIMIZATION 0
#define XPAR_MICROBLAZE_1_PC_WIDTH 32
#define XPAR_MICROBLAZE_1_PIADDR_SIZE 32
#define XPAR_MICROBLAZE_1_PVR 0
#define XPAR_MICROBLAZE_1_PVR_USER1 0x00
#define XPAR_MICROBLAZE_1_PVR_USER2 0x00000000
#define XPAR_MICROBLAZE_1_RESET_MSR 0x00000000
#define XPAR_MICROBLAZE_1_RESET_MSR_BIP 0
#define XPAR_MICROBLAZE_1_RESET_MSR_DCE 0
#define XPAR_MICROBLAZE_1_RESET_MSR_EE 0
#define XPAR_MICROBLAZE_1_RESET_MSR_EIP 0
#define XPAR_MICROBLAZE_1_RESET_MSR_ICE 0
#define XPAR_MICROBLAZE_1_RESET_MSR_IE 0
#define XPAR_MICROBLAZE_1_S0_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S0_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S1_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S1_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S2_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S2_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S3_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S3_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S4_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S4_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S5_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S5_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S6_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S6_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S7_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S7_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S8_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S8_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S9_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S9_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S10_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S10_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S11_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S11_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S12_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S12_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S13_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S13_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S14_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S14_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_S15_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_1_S15_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_1_SCO 0
#define XPAR_MICROBLAZE_1_TRACE 0
#define XPAR_MICROBLAZE_1_UNALIGNED_EXCEPTIONS 0
#define XPAR_MICROBLAZE_1_USE_BARREL 0
#define XPAR_MICROBLAZE_1_USE_BRANCH_TARGET_CACHE 0
#define XPAR_MICROBLAZE_1_USE_CONFIG_RESET 0
#define XPAR_MICROBLAZE_1_USE_DCACHE 0
#define XPAR_MICROBLAZE_1_USE_DIV 0
#define XPAR_MICROBLAZE_1_USE_EXTENDED_FSL_INSTR 0
#define XPAR_MICROBLAZE_1_USE_EXT_BRK 0
#define XPAR_MICROBLAZE_1_USE_EXT_NM_BRK 0
#define XPAR_MICROBLAZE_1_USE_FPU 0
#define XPAR_MICROBLAZE_1_USE_HW_MUL 0
#define XPAR_MICROBLAZE_1_USE_ICACHE 0
#define XPAR_MICROBLAZE_1_USE_INTERRUPT 0
#define XPAR_MICROBLAZE_1_USE_MMU 0
#define XPAR_MICROBLAZE_1_USE_MSR_INSTR 0
#define XPAR_MICROBLAZE_1_USE_NON_SECURE 0
#define XPAR_MICROBLAZE_1_USE_PCMP_INSTR 0
#define XPAR_MICROBLAZE_1_USE_REORDER_INSTR 1
#define XPAR_MICROBLAZE_1_USE_STACK_PROTECTION 0
#define XPAR_MICROBLAZE_1_COMPONENT_NAME system_microblaze_1_1
#define XPAR_MICROBLAZE_1_EDK_IPTYPE PROCESSOR
#define XPAR_MICROBLAZE_1_EDK_SPECIAL microblaze
#define XPAR_MICROBLAZE_1_G_TEMPLATE_LIST 0
#define XPAR_MICROBLAZE_1_G_USE_EXCEPTIONS 0

/******************************************************************/

#define XPAR_CPU_ID 1
#define XPAR_MICROBLAZE_ID 1
#define XPAR_MICROBLAZE_ADDR_SIZE 32
#define XPAR_MICROBLAZE_ADDR_TAG_BITS 17
#define XPAR_MICROBLAZE_ALLOW_DCACHE_WR 1
#define XPAR_MICROBLAZE_ALLOW_ICACHE_WR 1
#define XPAR_MICROBLAZE_AREA_OPTIMIZED 0
#define XPAR_MICROBLAZE_ASYNC_INTERRUPT 1
#define XPAR_MICROBLAZE_ASYNC_WAKEUP 3
#define XPAR_MICROBLAZE_AVOID_PRIMITIVES 0
#define XPAR_MICROBLAZE_BASE_VECTORS 0x0000000000000000
#define XPAR_MICROBLAZE_BRANCH_TARGET_CACHE_SIZE 0
#define XPAR_MICROBLAZE_CACHE_BYTE_SIZE 8192
#define XPAR_MICROBLAZE_DADDR_SIZE 32
#define XPAR_MICROBLAZE_DATA_SIZE 32
#define XPAR_MICROBLAZE_DCACHE_ADDR_TAG 17
#define XPAR_MICROBLAZE_DCACHE_ALWAYS_USED 0
#define XPAR_MICROBLAZE_DCACHE_BASEADDR 0x00000000
#define XPAR_MICROBLAZE_DCACHE_BYTE_SIZE 8192
#define XPAR_MICROBLAZE_DCACHE_DATA_WIDTH 0
#define XPAR_MICROBLAZE_DCACHE_FORCE_TAG_LUTRAM 0
#define XPAR_MICROBLAZE_DCACHE_HIGHADDR 0x3FFFFFFF
#define XPAR_MICROBLAZE_DCACHE_LINE_LEN 4
#define XPAR_MICROBLAZE_DCACHE_USE_WRITEBACK 0
#define XPAR_MICROBLAZE_DCACHE_VICTIMS 0
#define XPAR_MICROBLAZE_DC_AXI_MON 0
#define XPAR_MICROBLAZE_DEBUG_COUNTER_WIDTH 32
#define XPAR_MICROBLAZE_DEBUG_ENABLED 2
#define XPAR_MICROBLAZE_DEBUG_EVENT_COUNTERS 5
#define XPAR_MICROBLAZE_DEBUG_EXTERNAL_TRACE 0
#define XPAR_MICROBLAZE_DEBUG_INTERFACE 0
#define XPAR_MICROBLAZE_DEBUG_LATENCY_COUNTERS 1
#define XPAR_MICROBLAZE_DEBUG_PROFILE_SIZE 0
#define XPAR_MICROBLAZE_DEBUG_TRACE_ASYNC_RESET 0
#define XPAR_MICROBLAZE_DEBUG_TRACE_SIZE 8192
#define XPAR_MICROBLAZE_DIV_ZERO_EXCEPTION 0
#define XPAR_MICROBLAZE_DP_AXI_MON 0
#define XPAR_MICROBLAZE_DYNAMIC_BUS_SIZING 0
#define XPAR_MICROBLAZE_D_AXI 1
#define XPAR_MICROBLAZE_D_LMB 1
#define XPAR_MICROBLAZE_D_LMB_MON 0
#define XPAR_MICROBLAZE_ECC_USE_CE_EXCEPTION 0
#define XPAR_MICROBLAZE_EDGE_IS_POSITIVE 1
#define XPAR_MICROBLAZE_ENABLE_DISCRETE_PORTS 0
#define XPAR_MICROBLAZE_ENDIANNESS 1
#define XPAR_MICROBLAZE_FAULT_TOLERANT 0
#define XPAR_MICROBLAZE_FPU_EXCEPTION 0
#define XPAR_MICROBLAZE_FREQ 100000000
#define XPAR_MICROBLAZE_FSL_EXCEPTION 0
#define XPAR_MICROBLAZE_FSL_LINKS 0
#define XPAR_MICROBLAZE_IADDR_SIZE 32
#define XPAR_MICROBLAZE_ICACHE_ALWAYS_USED 0
#define XPAR_MICROBLAZE_ICACHE_BASEADDR 0x00000000
#define XPAR_MICROBLAZE_ICACHE_DATA_WIDTH 0
#define XPAR_MICROBLAZE_ICACHE_FORCE_TAG_LUTRAM 0
#define XPAR_MICROBLAZE_ICACHE_HIGHADDR 0x3FFFFFFF
#define XPAR_MICROBLAZE_ICACHE_LINE_LEN 4
#define XPAR_MICROBLAZE_ICACHE_STREAMS 0
#define XPAR_MICROBLAZE_ICACHE_VICTIMS 0
#define XPAR_MICROBLAZE_IC_AXI_MON 0
#define XPAR_MICROBLAZE_ILL_OPCODE_EXCEPTION 0
#define XPAR_MICROBLAZE_IMPRECISE_EXCEPTIONS 0
#define XPAR_MICROBLAZE_INSTR_SIZE 32
#define XPAR_MICROBLAZE_INTERCONNECT 2
#define XPAR_MICROBLAZE_INTERRUPT_IS_EDGE 0
#define XPAR_MICROBLAZE_INTERRUPT_MON 0
#define XPAR_MICROBLAZE_IP_AXI_MON 0
#define XPAR_MICROBLAZE_I_AXI 1
#define XPAR_MICROBLAZE_I_LMB 1
#define XPAR_MICROBLAZE_I_LMB_MON 0
#define XPAR_MICROBLAZE_LOCKSTEP_MASTER 0
#define XPAR_MICROBLAZE_LOCKSTEP_SELECT 0
#define XPAR_MICROBLAZE_LOCKSTEP_SLAVE 0
#define XPAR_MICROBLAZE_M0_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M0_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M1_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M1_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M2_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M2_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M3_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M3_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M4_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M4_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M5_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M5_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M6_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M6_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M7_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M7_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M8_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M8_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M9_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M9_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M10_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M10_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M11_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M11_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M12_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M12_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M13_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M13_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M14_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M14_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_M15_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M15_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_MMU_DTLB_SIZE 4
#define XPAR_MICROBLAZE_MMU_ITLB_SIZE 2
#define XPAR_MICROBLAZE_MMU_PRIVILEGED_INSTR 0
#define XPAR_MICROBLAZE_MMU_TLB_ACCESS 3
#define XPAR_MICROBLAZE_MMU_ZONES 16
#define XPAR_MICROBLAZE_M_AXI_DC_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_DC_ARUSER_WIDTH 5
#define XPAR_MICROBLAZE_M_AXI_DC_AWUSER_WIDTH 5
#define XPAR_MICROBLAZE_M_AXI_DC_BUSER_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_DC_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_DC_EXCLUSIVE_ACCESS 0
#define XPAR_MICROBLAZE_M_AXI_DC_RUSER_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_DC_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_DC_USER_SIGNALS 0
#define XPAR_MICROBLAZE_M_AXI_DC_USER_VALUE 31
#define XPAR_MICROBLAZE_M_AXI_DC_WUSER_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_DP_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_DP_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_DP_EXCLUSIVE_ACCESS 0
#define XPAR_MICROBLAZE_M_AXI_DP_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_D_BUS_EXCEPTION 0
#define XPAR_MICROBLAZE_M_AXI_IC_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_IC_ARUSER_WIDTH 5
#define XPAR_MICROBLAZE_M_AXI_IC_AWUSER_WIDTH 5
#define XPAR_MICROBLAZE_M_AXI_IC_BUSER_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_IC_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_IC_RUSER_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_IC_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_IC_USER_SIGNALS 0
#define XPAR_MICROBLAZE_M_AXI_IC_USER_VALUE 31
#define XPAR_MICROBLAZE_M_AXI_IC_WUSER_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_IP_ADDR_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_IP_DATA_WIDTH 32
#define XPAR_MICROBLAZE_M_AXI_IP_THREAD_ID_WIDTH 1
#define XPAR_MICROBLAZE_M_AXI_I_BUS_EXCEPTION 0
#define XPAR_MICROBLAZE_NUMBER_OF_PC_BRK 4
#define XPAR_MICROBLAZE_NUMBER_OF_RD_ADDR_BRK 2
#define XPAR_MICROBLAZE_NUMBER_OF_WR_ADDR_BRK 2
#define XPAR_MICROBLAZE_NUM_SYNC_FF_CLK 2
#define XPAR_MICROBLAZE_NUM_SYNC_FF_CLK_DEBUG 2
#define XPAR_MICROBLAZE_NUM_SYNC_FF_CLK_IRQ 1
#define XPAR_MICROBLAZE_NUM_SYNC_FF_DBG_CLK 1
#define XPAR_MICROBLAZE_NUM_SYNC_FF_DBG_TRACE_CLK 2
#define XPAR_MICROBLAZE_OPCODE_0X0_ILLEGAL 0
#define XPAR_MICROBLAZE_OPTIMIZATION 0
#define XPAR_MICROBLAZE_PC_WIDTH 32
#define XPAR_MICROBLAZE_PIADDR_SIZE 32
#define XPAR_MICROBLAZE_PVR 0
#define XPAR_MICROBLAZE_PVR_USER1 0x00
#define XPAR_MICROBLAZE_PVR_USER2 0x00000000
#define XPAR_MICROBLAZE_RESET_MSR 0x00000000
#define XPAR_MICROBLAZE_RESET_MSR_BIP 0
#define XPAR_MICROBLAZE_RESET_MSR_DCE 0
#define XPAR_MICROBLAZE_RESET_MSR_EE 0
#define XPAR_MICROBLAZE_RESET_MSR_EIP 0
#define XPAR_MICROBLAZE_RESET_MSR_ICE 0
#define XPAR_MICROBLAZE_RESET_MSR_IE 0
#define XPAR_MICROBLAZE_S0_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S0_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S1_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S1_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S2_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S2_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S3_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S3_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S4_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S4_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S5_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S5_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S6_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S6_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S7_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S7_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S8_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S8_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S9_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S9_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S10_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S10_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S11_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S11_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S12_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S12_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S13_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S13_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S14_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S14_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_S15_AXIS_DATA_WIDTH 32
#define XPAR_MICROBLAZE_S15_AXIS_PROTOCOL GENERIC
#define XPAR_MICROBLAZE_SCO 0
#define XPAR_MICROBLAZE_TRACE 0
#define XPAR_MICROBLAZE_UNALIGNED_EXCEPTIONS 0
#define XPAR_MICROBLAZE_USE_BARREL 0
#define XPAR_MICROBLAZE_USE_BRANCH_TARGET_CACHE 0
#define XPAR_MICROBLAZE_USE_CONFIG_RESET 0
#define XPAR_MICROBLAZE_USE_DCACHE 0
#define XPAR_MICROBLAZE_USE_DIV 0
#define XPAR_MICROBLAZE_USE_EXTENDED_FSL_INSTR 0
#define XPAR_MICROBLAZE_USE_EXT_BRK 0
#define XPAR_MICROBLAZE_USE_EXT_NM_BRK 0
#define XPAR_MICROBLAZE_USE_FPU 0
#define XPAR_MICROBLAZE_USE_HW_MUL 0
#define XPAR_MICROBLAZE_USE_ICACHE 0
#define XPAR_MICROBLAZE_USE_INTERRUPT 0
#define XPAR_MICROBLAZE_USE_MMU 0
#define XPAR_MICROBLAZE_USE_MSR_INSTR 0
#define XPAR_MICROBLAZE_USE_NON_SECURE 0
#define XPAR_MICROBLAZE_USE_PCMP_INSTR 0
#define XPAR_MICROBLAZE_USE_REORDER_INSTR 1
#define XPAR_MICROBLAZE_USE_STACK_PROTECTION 0
#define XPAR_MICROBLAZE_COMPONENT_NAME system_microblaze_1_1
#define XPAR_MICROBLAZE_EDK_IPTYPE PROCESSOR
#define XPAR_MICROBLAZE_EDK_SPECIAL microblaze
#define XPAR_MICROBLAZE_G_TEMPLATE_LIST 0
#define XPAR_MICROBLAZE_G_USE_EXCEPTIONS 0

/******************************************************************/


/******************************************************************/

/* Definitions for driver BRAM */
#define XPAR_XBRAM_NUM_INSTANCES 3U

/* Definitions for peripheral MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR */
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_DEVICE_ID 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_DATA_WIDTH 32U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_ECC 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_FAULT_INJECT 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_CE_FAILING_REGISTERS 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_UE_FAILING_REGISTERS 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_ECC_STATUS_REGISTERS 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_CE_COUNTER_WIDTH 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_ECC_ONOFF_REGISTER 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_ECC_ONOFF_RESET_VALUE 1U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_WRITE_ACCESS 2U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_BASEADDR 0x00000000U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_HIGHADDR 0x0000FFFFU
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_S_AXI_CTRL_BASEADDR 0xFFFFFFFFU 
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_S_AXI_CTRL_HIGHADDR 0xFFFFFFFFU 


/* Definitions for peripheral MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR */
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_DEVICE_ID 1U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_DATA_WIDTH 32U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_ECC 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_FAULT_INJECT 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_CE_FAILING_REGISTERS 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_UE_FAILING_REGISTERS 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_ECC_STATUS_REGISTERS 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_CE_COUNTER_WIDTH 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_ECC_ONOFF_REGISTER 0U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_ECC_ONOFF_RESET_VALUE 1U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_WRITE_ACCESS 2U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_BASEADDR 0x00000000U
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_HIGHADDR 0x0000FFFFU
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_S_AXI_CTRL_BASEADDR 0xFFFFFFFFU 
#define XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_S_AXI_CTRL_HIGHADDR 0xFFFFFFFFU 


/* Definitions for peripheral SHARE_AXI_BRAM_CTRL_1 */
#define XPAR_SHARE_AXI_BRAM_CTRL_1_DEVICE_ID 2U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_DATA_WIDTH 32U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_ECC 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_FAULT_INJECT 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_CE_FAILING_REGISTERS 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_UE_FAILING_REGISTERS 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_ECC_STATUS_REGISTERS 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_CE_COUNTER_WIDTH 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_ECC_ONOFF_REGISTER 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_ECC_ONOFF_RESET_VALUE 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_WRITE_ACCESS 0U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_S_AXI_BASEADDR 0x40000000U
#define XPAR_SHARE_AXI_BRAM_CTRL_1_S_AXI_HIGHADDR 0x40001FFFU
#define XPAR_SHARE_AXI_BRAM_CTRL_1_S_AXI_CTRL_BASEADDR 0xFFFFFFFFU 
#define XPAR_SHARE_AXI_BRAM_CTRL_1_S_AXI_CTRL_HIGHADDR 0xFFFFFFFFU 


/******************************************************************/

/* Canonical definitions for peripheral MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR */
#define XPAR_BRAM_0_DEVICE_ID XPAR_MICROBLAZE_1_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_DEVICE_ID
#define XPAR_BRAM_0_DATA_WIDTH 32U
#define XPAR_BRAM_0_ECC 0U
#define XPAR_BRAM_0_FAULT_INJECT 0U
#define XPAR_BRAM_0_CE_FAILING_REGISTERS 0U
#define XPAR_BRAM_0_UE_FAILING_REGISTERS 0U
#define XPAR_BRAM_0_ECC_STATUS_REGISTERS 0U
#define XPAR_BRAM_0_CE_COUNTER_WIDTH 0U
#define XPAR_BRAM_0_ECC_ONOFF_REGISTER 0U
#define XPAR_BRAM_0_ECC_ONOFF_RESET_VALUE 1U
#define XPAR_BRAM_0_WRITE_ACCESS 2U
#define XPAR_BRAM_0_BASEADDR 0x00000000U
#define XPAR_BRAM_0_HIGHADDR 0x0000FFFFU

/* Canonical definitions for peripheral MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR */
#define XPAR_BRAM_1_DEVICE_ID XPAR_MICROBLAZE_1_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_DEVICE_ID
#define XPAR_BRAM_1_DATA_WIDTH 32U
#define XPAR_BRAM_1_ECC 0U
#define XPAR_BRAM_1_FAULT_INJECT 0U
#define XPAR_BRAM_1_CE_FAILING_REGISTERS 0U
#define XPAR_BRAM_1_UE_FAILING_REGISTERS 0U
#define XPAR_BRAM_1_ECC_STATUS_REGISTERS 0U
#define XPAR_BRAM_1_CE_COUNTER_WIDTH 0U
#define XPAR_BRAM_1_ECC_ONOFF_REGISTER 0U
#define XPAR_BRAM_1_ECC_ONOFF_RESET_VALUE 1U
#define XPAR_BRAM_1_WRITE_ACCESS 2U
#define XPAR_BRAM_1_BASEADDR 0x00000000U
#define XPAR_BRAM_1_HIGHADDR 0x0000FFFFU

/* Canonical definitions for peripheral SHARE_AXI_BRAM_CTRL_1 */
#define XPAR_BRAM_2_DEVICE_ID XPAR_SHARE_AXI_BRAM_CTRL_1_DEVICE_ID
#define XPAR_BRAM_2_DATA_WIDTH 32U
#define XPAR_BRAM_2_ECC 0U
#define XPAR_BRAM_2_FAULT_INJECT 0U
#define XPAR_BRAM_2_CE_FAILING_REGISTERS 0U
#define XPAR_BRAM_2_UE_FAILING_REGISTERS 0U
#define XPAR_BRAM_2_ECC_STATUS_REGISTERS 0U
#define XPAR_BRAM_2_CE_COUNTER_WIDTH 0U
#define XPAR_BRAM_2_ECC_ONOFF_REGISTER 0U
#define XPAR_BRAM_2_ECC_ONOFF_RESET_VALUE 0U
#define XPAR_BRAM_2_WRITE_ACCESS 0U
#define XPAR_BRAM_2_BASEADDR 0x40000000U
#define XPAR_BRAM_2_HIGHADDR 0x40001FFFU


/******************************************************************/

#endif  /* end of protection macro */
