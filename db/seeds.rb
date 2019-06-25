
user = User.create(email: 'test@adi-space.tk', password: 'test')
butter = Product.create(name: 'butter', price: 1.5, deleted: false)
cheese = Product.create(name: 'cheese', price: 2.79, deleted: false)
uuid = 200
i = 0
num = 25

while i < num  do
    Tag.create(product_id: cheese.id, paid: false, uuid: uuid)
   i +=1
   uuid += 1
end
i=0
while i < num  do
    Tag.create(product_id: butter.id, paid: false, uuid: uuid)
   i +=1
   uuid += 1
end
i=0
while i < 3  do
    Sensor.create(deleted: false)
    i +=1
end

