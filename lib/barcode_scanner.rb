require_relative "buffer"
require_relative "printer"
require_relative "scanner"

class BarcodeScanner
  class << self
    def scan(code)
      ::Scanner.new(buffer).call(code)
    end
    
    def exit
      ::Printer.new(buffer).call
    end

    def buffer
      @buffer ||= Buffer.new
    end
  end
end
