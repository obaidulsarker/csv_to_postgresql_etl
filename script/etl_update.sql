UPDATE shopify_track
SET 
sku = s.sku, 
collection1 = s.collection1, 
collection2 = s.collection2, 
collection3 = s.collection3, 
collection4 = s.collection4, 
collection5 = s.collection5, 
tags = s.tags, 
producttitle = s.producttitle, 
varianttitle = s.varianttitle, 
price = s.price, 
compareatprice = s.compareatprice, 
instock = s.instock, 
producturl = s.producturl, 
imageurl = s.imageurl, 
description = s.description, 
descriptionnohtml = s.descriptionnohtml, 
updatedat = s.updatedat
FROM stg.shopify_track_new AS s
INNER JOIN stg.shopify_track_old AS d 
	ON (s.host = d.host AND s.shopifyid = d.shopifyid AND s.variantid = d.variantid);