
itemsPrice = c(100,250,300,500,700, 900)
itemPriceAfterVat = itemsPrice + itemsPrice *.05



plot(x=itemsPrice, 
     y=itemPriceAfterVat,
     type="p",
     main= "prices after tax",
     xlab= "Original price",
     ylab= "VAT", 
     xlim= c(100,900),
     ylim= c(100,1000)
)



