json.array! @products do |product|
	json.id product.id
	json.name product.name
	json.price product.price
end