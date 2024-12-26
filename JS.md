## ``undefined`` 与 ``null`` 的区别

在 JavaScript 中，`undefined` 和 `null` 都表示“没有值”的状态，但它们有着不同的语义和用途。以下是它们的主要区别：

### 1. **定义与语义**

- **`undefined`**:

  - 表示一个变量已经被声明，但还没有被赋值。

  - 或者表示某个属性或函数的返回值没有明确指定。

  - 它是 JavaScript 引擎自动赋予未赋值变量的默认值。

  - 例如：

    ```
    1let a;
    2console.log(a); // 输出: undefined
    ```

- **`null`**:

  - 表示一个有意的“空”或“不存在”的值，通常用于表示对象的引用为空。

  - 它是一个显式的赋值，意味着开发者主动将某个值设置为 `null`。

  - 例如：

    ```
    1let b = null;
    2console.log(b); // 输出: null
    ```

### 2. **类型**

- **`undefined`** 的类型是 `undefined`。
- **`null`** 的类型是 `object`（这是一个历史遗留问题，实际上 `null` 应该更接近于表示“空引用”）。

```
1console.log(typeof undefined); // "undefined"
2console.log(typeof null);      // "object"
```

### 3. **使用场景**

- `undefined`

  :

  - 当你声明了一个变量但没有给它赋值时，它的值就是 `undefined`。
  - 函数没有返回值时，默认返回 `undefined`。
  - 对象中不存在的属性也会返回 `undefined`。

- `null`

  :

  - 通常用于表示对象的引用为空，或者表示某种“无意义”的状态。
  - 在 API 或数据结构中，`null` 常常用来表示“不存在”或“无效”的对象。

### 4. **相等性比较**

- 严格相等 (`===`)
  - `undefined === null` 返回 `false`，因为它们是不同的类型。
- 宽松相等 (`==`)
  - `undefined == null` 返回 `true`，因为在宽松相等比较中，JavaScript 会进行类型转换，认为它们是“相等”的。

```
1console.log(undefined === null); // false
2console.log(undefined == null);  // true
```

### 5. **总结**

- **`undefined`** 是 JavaScript 引擎自动赋予未赋值变量的默认值，表示“未定义”。
- **`null`** 是开发者显式赋值的值，表示“空引用”或“不存在的对象”。

理解这两者的区别有助于编写更清晰、避免潜在错误的代码。