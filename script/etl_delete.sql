DELETE FROM shopify_track AS s
WHERE  EXISTS ( SELECT 1 FROM (
	SELECT o.*
		FROM stg.shopify_track_old AS o
		WHERE NOT EXISTS (SELECT 1 FROM stg.shopify_track_new AS n 
						WHERE o.host = n.host AND o.shopifyid = n.shopifyid AND o.variantid = n.variantid)
) d WHERE (s.host = d.host AND s.shopifyid = d.shopifyid AND s.variantid = d.variantid));