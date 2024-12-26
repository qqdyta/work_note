# 系统设置

### 延时

``` c++
vTaskDelay(50 / portTICK_PERIOD_MS)
```

## 占位符

1. **`%d`** 或 **`%i`**

   - **作用**: 用于输出十进制整数。

   - 示例

     :

     ```
     1int num = 123;
     2printf("The number is %d\n", num);  // 输出: The number is 123
     ```

2. **`%u`**

   - **作用**: 用于输出无符号十进制整数。

   - 示例

     :

     ```
     1unsigned int unum = 123;
     2printf("The unsigned number is %u\n", unum);  // 输出: The unsigned number is 123
     ```

3. **`%f`**

   - **作用**: 用于输出浮点数。

   - 示例

     :

     ```
     1float fnum = 123.456;
     2printf("The float number is %f\n", fnum);  // 输出: The float number is 123.456000
     ```

4. **`%e`** 或 **`%E`**

   - **作用**: 用于输出科学记数法表示的浮点数。

   - 示例

     :

     ```
     1double dnum = 123456789.0;
     2printf("The scientific notation is %e\n", dnum);  // 输出: The scientific notation is 1.234568e+08
     ```

5. **`%g`** 或 **`%G`**

   - **作用**: 用于输出浮点数，根据数值大小自动选择 `%f` 或 `%e` 格式。

   - 示例

     :

     ```
     1double gnum = 123456789.0;
     2printf("The general format is %g\n", gnum);  // 输出: The general format is 1.23457e+08
     ```

6. **`%c`**

   - **作用**: 用于输出单个字符。

   - 示例

     :

     ```
     1char ch = 'A';
     2printf("The character is %c\n", ch);  // 输出: The character is A
     ```

7. **`%s`**

   - **作用**: 用于输出字符串。

   - 示例

     :

     ```
     1const char* str = "Hello, World!";
     2printf("The string is %s\n", str);  // 输出: The string is Hello, World!
     ```

8. **`%p`**

   - **作用**: 用于输出指针地址。

   - 示例

     :

     ```
     1int* ptr = &num;
     2printf("The pointer address is %p\n", (void*)ptr);  // 输出: The pointer address is 0x7ffee4bff5ac
     ```

9. **`%x`** 或 **`%X`**

   - **作用**: 用于输出十六进制整数（小写或大写）。

   - 示例

     :

     ```
     1int hexnum = 123;
     2printf("The hexadecimal number is %x\n", hexnum);  // 输出: The hexadecimal number is 7b
     3printf("The hexadecimal number is %X\n", hexnum);  // 输出: The hexadecimal number is 7B
     ```

10. **`%o`**

    - **作用**: 用于输出八进制整数。

    - 示例

      :

      ```
      1int octnum = 123;
      2printf("The octal number is %o\n", octnum);  // 输出: The octal number is 173
      ```

11. **`%%`**

    - **作用**: 用于输出百分号本身。

    - 示例

      :

      ```
      1printf("This is a percent sign: %%\n");  // 输出: This is a percent sign: %
      ```

# GPIO 设置

### `gpio_config_t` 结构体

`gpio_config_t` 结构体定义在 `driver/gpio.h` 头文件中，其定义如下：

```
1typedef struct {
2    gpio_mode_t mode;          // GPIO 模式
3    gpio_pullup_t pull_up_en;  // 上拉使能
4    gpio_pulldown_t pull_down_en;  // 下拉使能
5    gpio_intr_type_t intr_type;  // 中断类型
6    uint64_t pin_bit_mask;     // 要配置的引脚掩码
7} gpio_config_t;
```

### 各个参数的作用和可选值

1. **mode**:

   - **类型**: `gpio_mode_t`

   - **作用**: 设置 GPIO 的工作模式。

   - 可选值

     :

     - `GPIO_MODE_DISABLE`: 禁用 GPIO。
     - `GPIO_MODE_INPUT`: 配置为输入模式。
     - `GPIO_MODE_OUTPUT`: 配置为输出模式。
     - `GPIO_MODE_OUTPUT_OD`: 配置为开漏输出模式。
     - `GPIO_MODE_INPUT_OUTPUT`: 配置为输入/输出模式（不常用）。

2. **pull_up_en**:

   - **类型**: `gpio_pullup_t`

   - **作用**: 使能上拉电阻。

   - 可选值

     :

     - `GPIO_PULLUP_DISABLE`: 禁用上拉电阻。
     - `GPIO_PULLUP_ENABLE`: 使能上拉电阻。

3. **pull_down_en**:

   - **类型**: `gpio_pulldown_t`

   - **作用**: 使能下拉电阻。

   - 可选值

     :

     - `GPIO_PULLDOWN_DISABLE`: 禁用下拉电阻。
     - `GPIO_PULLDOWN_ENABLE`: 使能下拉电阻。

4. **intr_type**:

   - **类型**: `gpio_intr_type_t`

   - **作用**: 设置中断类型。

   - 可选值

     :

     - `GPIO_INTR_DISABLE`: 禁用中断。
     - `GPIO_INTR_POSEDGE`: 上升沿触发中断。
     - `GPIO_INTR_NEGEDGE`: 下降沿触发中断。
     - `GPIO_INTR_ANYEDGE`: 任意边沿触发中断。
     - `GPIO_INTR_LOW_LEVEL`: 低电平触发中断。
     - `GPIO_INTR_HIGH_LEVEL`: 高电平触发中断。

5. **pin_bit_mask**:

   - **类型**: `uint64_t`
   - **作用**: 指定要配置的引脚掩码。每个位对应一个 GPIO 引脚，例如 `0x00000001` 表示 GPIO0，`0x00000002` 表示 GPIO1，依此类推。

### 示例代码

#### 配置 GPIO 为输入模式

```
1#include "driver/gpio.h"
2
3void configure_gpio_input() {
4    gpio_config_t io_conf;
5    // 配置 GPIO12 为输入模式
6    io_conf.intr_type = GPIO_INTR_DISABLE;  // 禁用中断
7    io_conf.mode = GPIO_MODE_INPUT;         // 设置为输入模式
8    io_conf.pull_up_en = GPIO_PULLUP_ENABLE; // 使能上拉电阻
9    io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE; // 禁用下拉电阻
10    io_conf.pin_bit_mask = (1ULL << 12);    // 配置 GPIO12
11    gpio_config(&io_conf);
12}
```

#### 配置 GPIO 为输出模式并设置初始电平

```
1#include "driver/gpio.h"
2
3void configure_gpio_output() {
4    gpio_config_t io_conf;
5    // 配置 GPIO13 为输出模式
6    io_conf.intr_type = GPIO_INTR_DISABLE;  // 禁用中断
7    io_conf.mode = GPIO_MODE_OUTPUT;        // 设置为输出模式
8    io_conf.pull_up_en = GPIO_PULLUP_DISABLE; // 禁用上拉电阻
9    io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE; // 禁用下拉电阻
10    io_conf.pin_bit_mask = (1ULL << 13);    // 配置 GPIO13
11    gpio_config(&io_conf);
12
13    // 设置 GPIO13 输出高电平
14    gpio_set_level(GPIO_NUM_13, 1);
15
16    // 设置 GPIO13 输出低电平
17    gpio_set_level(GPIO_NUM_13, 0);
18}
```
