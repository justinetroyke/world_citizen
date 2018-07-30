# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fb = Category.create!(name: 'F&B')
product = Category.create!(name: 'Product')

fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", business_location: '10446 Town Center Dr, Westminster, CO 80021', name: 'Pizookie', donation_amount: 'potion', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Suite 1100 N, Bethesda, MD 20814')
product.items.create!(business_name: 'SameDay Office Supply', business_location: '7076 S Alton Way, Centennial, CO 80112', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')
product.items.create!(business_name: 'KITTLE REAL ESTATE', business_location: '300 S Howes St, Fort Collins, CO 80521', name: 'real estate', donation_amount: '$9,000.00', organization: 'Sell a Home, Save a Child', organization_location: '300 S Howes St, Fort Collins, CO 80521')
product.items.create!(business_name: 'McDonald Independent PreOwned Subaru',  business_location: '4550 S Broadway, Englewood, CO 80113', name: 'pre-owned car', donation_amount: '$50', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')
product.items.create!(business_name: 'Harvest Farm', business_location: '4240 E Co Rd 66, Wellington, CO 80549', name: 'pre-owned car', donation_amount: '$50', organization: 'Denver Rescue Mission', organization_location: '4240 E Co Rd 66, Wellington, CO 80549')
product.items.create!(business_name: 'TRENCHTOWN', business_location: '734 Sheridan Blvd, Denver, CO 80214', name: 'clothing', donation_amount: 'proceeds', organization: 'Mission:Hope', organization_location: '1300 Joseph E. Boone Blvd NW Atlanta, GA 30314')
product.items.create!(business_name: 'FLEEPS', business_location: '2650 6th Ave, Denver, CO 80204', name: 'shoes', donation_amount: 'a day of school', organization: 'Fleeps Foundation', organization_location: '2650 W 6th Ave, Denver, CO 80204')
fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', business_location: '7295 Washington St, Denver, CO 80229', name: 'Brew of Bravery Coffee', donation_amount: '2 bags of coffee', organization: 'USO', organization_location: '8400 Peña Blvd unit 492093, Denver, CO 802494')
fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', business_location: '7295 Washington St, Denver, CO 80229', name: 'Surfers for Autism Coffee', donation_amount: '$1', organization: 'Surfers for Autism', organization_location: '7491 N. Federal Hwy, Boca Raton  FL  33487')
fb.items.create!(business_name: 'Hedge Row',  business_location: '100 Steele St, Denver, CO 80206', name: 'cocktail booklet', donation_amount: 'proceeds', organization: 'The Park People', organization_location: '1510 S. Grant St. Denver, CO 80210')
