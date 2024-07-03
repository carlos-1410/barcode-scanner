## Implement a Barcode Scanner

Assume the following setup:

1. Input device - Barcode scanner with Exit button

2. Two output devices: LCD Display, Printer

### Implement the following flow

User scans barcode on a product
- If product is found then product name and price is displayed on a LCD Display
- If product is not found / or barcode is invalid then “Product not found” error message is printed on LCD Display
- User can scan multiple products, one a time

When “Exit” button is pressed
- List of all properly scanned items with prices is printed on Printer together with Total Sum
- Total sum is displayed on LCD Display
