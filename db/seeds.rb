# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Stamp.create!(name: 'Local')
Stamp.create!(name: 'District')
Stamp.create!(name: 'Regional')
Stamp.create!(name: 'National')
Stamp.create!(name: 'International')

fb = Category.create!(name: 'F&B')
product = Category.create!(name: 'Product')

fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", business_location: '10446 Town Center Dr, Westminster, CO 80021', name: 'Pizookie', donation_amount: 'portion of the proceeds', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Bethesda, MD 20814')
product.items.create!(business_name: 'SameDay Office Supply', business_location: '7076 S Alton Way, Centennial, CO 80112', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')
product.items.create!(business_name: 'KITTLE REAL ESTATE', business_location: '300 S Howes St, Fort Collins, CO 80521', name: 'real estate', donation_amount: '$9,000.00', organization: 'Sell a Home, Save a Child', organization_location: '300 S Howes St, Fort Collins, CO 80521')
product.items.create!(business_name: 'McDonald Independent PreOwned Subaru',  business_location: '4550 S Broadway, Englewood, CO 80113', name: 'pre-owned car', donation_amount: '$50', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')
product.items.create!(business_name: 'Harvest Farm', business_location: '4240 E Co Rd 66, Wellington, CO 80549', name: 'pre-owned car', donation_amount: '$50', organization: 'Denver Rescue Mission', organization_location: '4240 E Co Rd 66, Wellington, CO 80549')
product.items.create!(business_name: 'TRENCHTOWN', business_location: '734 Sheridan Blvd, Denver, CO 80214', name: 'clothing', donation_amount: 'proceeds', organization: 'Mission:Hope', organization_location: '1300 Joseph E. Boone Blvd NW Atlanta, GA 30314')
product.items.create!(business_name: 'FLEEPS', business_location: '2650 6th Ave, Denver, CO 80204', name: 'shoes', donation_amount: 'a day of school', organization: 'Fleeps Foundation', organization_location: '2650 W 6th Ave, Denver, CO 80204')
fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', business_location: '7295 Washington St, Denver, CO 80229', name: 'Brew of Bravery Coffee', donation_amount: '2 bags of coffee', organization: 'USO', organization_location: '8400 Pena Blvd, Denver, CO 80249')
fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', business_location: '7295 Washington St, Denver, CO 80229', name: 'Surfers for Autism Coffee', donation_amount: '$1', organization: 'Surfers for Autism', organization_location: '7491 N. Federal Hwy, Boca Raton, FL 33487')
fb.items.create!(business_name: 'Hedge Row',  business_location: '100 Steele St, Denver, CO 80206', name: 'cocktail booklet', donation_amount: 'proceeds', organization: 'The Park People', organization_location: '1510 S. Grant St. Denver, CO 80210')
product.items.create!(business_name: 'The Tote Project', business_location: '16161 Ventura Blvd, Encino, CA 91436', name: 'any purchase', donation_amount: '20% of profits', organization: 'Two Wings', organization_location: '3650 W Martin Luther King Jr Blvd, Los Angeles, CA 90008')
product.items.create!(business_name: 'Marc Skid', business_location: 'Brookhaven, Ga. 31119', name: 'any pair of underwear', donation_amount: '$4', organization: "Purchaser's Pick", organization_location: 'Brookhaven, Ga. 31119')
product.items.create!(business_name: 'Mable', business_location: '828 Franklin St, San francisco, CA 94102', name: 'toothbrush', donation_amount: '1 toothbrush', organization: "Buy. Give. Teach.", organization_location: '828 Franklin St, San francisco, CA 94102')
product.items.create!(business_name: '1040.com', business_location: '235 E Palmer St, Franklin, NC 28734', name: 'tax return', donation_amount: '$2', organization: "Healing Water International", organization_location: '15000 W 6th Ave Frontage Rd, Golden, CO 80401')
product.items.create!(business_name: 'Warby Parker', business_location: '161 6th Ave, New York, NY 10013', name: 'glasses', donation_amount: 'glasses', organization: "VisionSpring", organization_location: '505 8th Avenue, New York, NY 10018')
product.items.create!(business_name: 'Toms', business_location: '5404 Jandy Pl, Los Angeles, CA 90066', name: 'shoes', donation_amount: 'shoes', organization: "REAP", organization_location: '616 Serra St, Stanford, CA 94305')
# product.items.create!(business_name: 'Nintaanzi', business_location: 'Ex Avenida Santa Rosa, Juan Pablo II 430, Peru 07001, Peru', name: 'necklace', donation_amount: '20% of annual sales', organization: "Homebuilding in Peru", organization_location: 'Ex Avenida Santa Rosa, Juan Pablo II 430, Peru 07001, Peru')
# product.items.create!(business_name: 'Yuhme', business_location: 'Sundsvall, Sweden 852 29', name: 'water bottle', donation_amount: '6 month water supply', organization: "WaterAid", organization_location: 'Central African Republic')
# product.items.create!(business_name: 'Woodsi Sunglasses', business_location: 'Port Macquarie, New South Wales 2444, Australia', name: 'sunglasses', donation_amount: 'plant a tree', organization: "Woodsi", organization_location: 'Port Macquarie, New South Wales 2444, Australia')
