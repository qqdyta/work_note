# 创建一个VUE项目

``` shell
vue create projectName
```



## VUE3中导入element-plus

在main.js中添加以下代码

```javascript
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
app.use(ElementPlus)
```



### 占位符

``` html
&nbsp;
```



# VUE3 script setup

### 使用事件实例

```javascript
import { defineProps, getCurrentInstance } from 'vue'
const { proxy } = getCurrentInstance()
proxy.$emitter.emit('updateAllProcessData');
```

# HTML元素同一行显示

