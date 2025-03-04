/**
 * 触发复制事件的元素在 Modal 中，复制不生效。
解决办法：将 document.body.appendChild(input) 改成 ref?.current.appendChild(input)，然后把 ref 赋给 Modal 内包裹的一个 div 中，就能解决 range 的问题。盲猜是因为 Modal 脱离了文本流，所以绑定的事件就拿不到外部的 document.body 里的 input 的内容，让 input 也脱离文本流就行了
 * @param text 
 * @param dom 
 * @returns 
 */
export function copyToClip(text: string, dom?: HTMLDivElement) {
    return new Promise((resolve, reject) => {
      try {
        const input: HTMLTextAreaElement = document.createElement("textarea");
        input.setAttribute("readonly", "readonly");
        input.value = text;
        if (dom) {
          dom.appendChild(input);
        } else {
          document.body.appendChild(input);
        }
        input.select();
        if (document.execCommand("copy")) document.execCommand("copy");
        if (dom) {
          dom.removeChild(input);
        } else {
          document.body.removeChild(input);
        }
        resolve(text);
      } catch (error) {
        reject(error);
      }
    });
  }
  