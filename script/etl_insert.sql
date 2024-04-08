INSERT INTO shopify_track (id, host, shopifyid, variantid, sku, collection1, collection2, collection3, collection4, collection5, tags, 
        producttitle, varianttitle, price, compareatprice, instock, producturl, imageurl, 
        description, descriptionnohtml, updatedat)
SELECT 
        s.id::uuid, s.host, s.shopifyid, s.variantid, s.sku, s.collection1, s.collection2, s.collection3, s.collection4, s.collection5, s.tags, 
        s.producttitle, s.varianttitle, s.price, s.compareatprice, s.instock, s.producturl, s.imageurl, s.description, 
        s.descriptionnohtml, s.updatedat
FROM stg.shopify_track_new s
WHERE NOT EXISTS ( SELECT 1 FROM stg.shopify_track_old d WHERE (s.host = d.host AND s.shopifyid = d.shopifyid AND s.variantid = d.variantid));