@Component
export default struct selection {
  @Link selection: SelectOption[]
  private callback: (index: number, value?: string) => void = () => {};
  // private text: string
  @Link placeholder:ResourceStr;

  build() {



    Column() {

      //设置SelectOption对象参数
      Select(this.selection)
        .selected(0)
        .value(this.placeholder)
        .font({ size: 16, weight: 500 })
        .selectedOptionFont({ size: 16, weight: FontWeight.Regular })
        .optionFont({ size: 16, weight: 400 })
        .onSelect((index: number, value: string) => {
          this.callback?.(index, value)
        })
        .width('100%')
    }
  }
}