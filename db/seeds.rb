
sensor = Sensor.create(deleted: false)
user = User.create(email: 'test@adi-space.tk', password: 'test')
butter = Product.create(name: 'butter', price: 1.5, deleted: false)
cheese = Product.create(name: 'cheese', price: 2.79, deleted: false)
tag_1 = Tag.create(product_id: butter.id, paid: false)
tag_2 = Tag.create(product_id: butter.id, paid: false)
tag_3 = Tag.create(product_id: cheese.id, paid: false)
tag_4 = Tag.create(product_id: cheese.id, paid: false)

