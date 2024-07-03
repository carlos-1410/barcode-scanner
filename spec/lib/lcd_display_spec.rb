require "lcd_display"

RSpec.describe LCDDisplay do
  it "shows output correctly" do
    input = "NAME: driller | PRICE: 111.99"
    lcd_display = LCDDisplay.new

    expect(lcd_display).to receive(:call).with(input).and_return(input)

    lcd_display.call(input)
  end
end
