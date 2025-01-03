
#define TIMER_ADDR                  0x00000000

#define LED_READ_ADDR               0x00010000
#define LED_WRITE_ADDR              0x00010004
#define	LED_DIR_ADDR                0x00010008

#define LED_MEM_ADDR                0x00040000

#define HUB75S_CONFIG_ADDR                              0x00020000

#define HUB75S_CONFIG_ENABLE_FIELD_START                0
#define HUB75S_CONFIG_ENABLE_FIELD_LENGTH               1

#define HUB75S_CONFIG_START_FIELD_START                 1
#define HUB75S_CONFIG_START_FIELD_LENGTH                1

#define HUB75S_CONFIG_AUTO_RESTART_FIELD_START          2
#define HUB75S_CONFIG_AUTO_RESTART_FIELD_LENGTH         1

#define HUB75S_CONFIG_BUFFER_NR_FIELD_START             4
#define HUB75S_CONFIG_BUFFER_NR_FIELD_LENGTH            1


#define HUB75S_STATUS_ADDR                              0x00020004

#define HUB75S_STATUS_CUR_PANEL_NR_FIELD_START          0
#define HUB75S_STATUS_CUR_PANEL_NR_FIELD_LENGTH         4

#define HUB75S_STATUS_CUR_ROW_NR_FIELD_START            8
#define HUB75S_STATUS_CUR_ROW_NR_FIELD_LENGTH           5

#define HUB75S_STATUS_CUR_BIT_NR_FIELD_START            16
#define HUB75S_STATUS_CUR_BIT_NR_FIELD_LENGTH           3

#define HUB75S_STATUS_CUR_BUFFER_NR_FIELD_START         31
#define HUB75S_STATUS_CUR_BUFFER_NR_FIELD_LENGTH        1

#define HUB75S_FRAME_CNTR_ADDR                          0x00020008

#define HUB75S_RGB_DIM_ADDR                             0x0002000c

#define HUB75S_PANEL_INFOS_ADDR                         0x00020100

#define HUB75S_PANEL_INFO_X_SIZE                        0x40

#define HUB75S_PANEL_INFO_X_MISC_ADDR                   0x00
#define HUB75S_PANEL_INFO_X_MEM_ADDR_START_PH0_ADDR     0x04
#define HUB75S_PANEL_INFO_X_MEM_ADDR_START_PH1_ADDR     0x08
#define HUB75S_PANEL_INFO_X_MEM_ADDR_COL_MUL_ADDR       0x0c
#define HUB75S_PANEL_INFO_X_MEM_ADDR_ROW_MUL_ADDR       0x10

#define HUB75S_PI_REG_WR(idx, reg_name, wr_data)        (*( (volatile uint32_t *)(0x80000000 | (HUB75S_PANEL_INFOS_ADDR + (HUB75S_PANEL_INFO_X_SIZE * idx) + HUB75S_PANEL_INFO_X_##reg_name##_ADDR) )) = (wr_data))


