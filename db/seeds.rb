alice = User.create! { |u| u.email, u.name = 'alice@example.com', 'Alice' }
anorak = alice.wares.create! { |p| p.name = 'Anorak' }
armchair = alice.wares.create! { |p| p.name = 'Armchair' }
bob = User.create! { |u| u.email, u.name = 'bob@example.com', 'Bob' }
bun = bob.wares.create! { |p| p.name = 'Bun' }
biscuit = bob.wares.create! { |p| p.name = 'Biscuit' }
cecil = User.create! { |u| u.email, u.name = 'cecil@example.com', 'Cecil' }
crisps = cecil.wares.create! { |p| p.name = 'Crisps' }
chips = cecil.wares.create! { |p| p.name = 'Chips' }
anorak.categories << Category.find_or_create_by_name('Clothes')
armchair.categories << Category.find_or_create_by_name('Furniture')
[bun, biscuit, crisps, chips].each { |x| Category.find_or_create_by_name('Food') }
[bun, biscuit].each { |x| x.tag_with "baked" }
[crisps, chips].each { |x| x.tag_with %w(fried unhealthy) }
