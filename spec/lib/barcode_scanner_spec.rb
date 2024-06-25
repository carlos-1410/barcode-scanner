require "barcode_scanner"
require "buffer"
require "printer"
require "scanner"

RSpec.describe BarcodeScanner do
  it "scans single product" do
    BarcodeScanner.scan("19974XJ39L1835013")
    expected_output = "NAME: screwdriver | PRICE: 15.99" \
                      "\n---------\nTOTAL: 15.99"

    expect(BarcodeScanner.exit).to eq(expected_output)
  end

  it "scans multiple products" do
    %w(198RWW2K0VZ974863 5799EMAFXP7102781 19974XJ39L1835013
      574KVZT94VE737564 4517AF2U5A7851400 167492NY3C8648905).each do |code|
        BarcodeScanner.scan(code)
      end
      expected_output = "NAME: screwdriver | PRICE: 15.99\n" \
      "NAME: driller | PRICE: 111.99\n" \
      "NAME: hammer | PRICE: 5.99\n" \
      "NAME: screwdriver | PRICE: 15.99\n" \
      "NAME: soldering iron | PRICE: 33.99\n" \
      "NAME: wooden stick | PRICE: 0.5\n" \
      "NAME: karkowka | PRICE: 11.22" \
      "\n---------\nTOTAL: 195.67"

      expect(BarcodeScanner.exit).to eq(expected_output)
  end
end
