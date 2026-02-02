insert into places (name, slug, summary, body)
values
(
  'Serengeti National Park',
  'serengeti',
  'World-famous for the Great Migration and vast, honey-lit plains at sunset.',
  $$The magic of Serengeti National Park is not easy to describe in words. Not only seeing, but also hearing the buzz of millions of wildebeest so thick in the air that it vibrates through your entire body is something you will try to describe to friends and family, before realising it’s impossible. Vistas of honey-lit plains at sunset so beautiful, it’s worth the trip just to witness this. The genuine smiles of the Maasai people, giving you an immediate warming glow inside.

Today, most visitors come here with one aim alone: to witness millions of wildebeest, zebras, gazelles and elands on a mass trek to quench their thirst for water and eat fresh grass. During this great cyclical movement, these ungulates move around the ecosystem in a seasonal pattern, defined by rainfall and grass nutrients. These large herds of animals on the move can’t be witnessed anywhere else.

Over the years, the Serengeti has played a pivotal role in shaping our understanding of biodiversity and ecological balance. In the 1950s, it was designated a national park, ensuring the preservation of its unique habitats and wildlife for generations to come.$$ 
),
(
  'Mount Kilimanjaro',
  'kilimanjaro',
  'Africa’s highest peak, formed by volcanic eruptions millions of years ago.',
  $$Mount Kilimanjaro’s three peaks were formed after volcanic eruptions millions of years ago. One volcanic cone, Shira, is now extinct and eroded, while the other two, Mawenzi and Kibo, “melted” together after subsequent eruptions. Kibo is now the highest with its famous Uhuru peak at almost 6000m above sea level.

There is no single explanation for Kilimanjaro’s name and there are many theories as to where it comes from. Local peoples have looked at Kilimanjaro with reverence and named it “Mountain of Greatness” (Swahili) or “That which defeats the caravan” (Chagga) or “White Mountain” (Maasai). The Maasai have also called it “The mountain of Water”, as it is the source of water for the area.

The origin and meaning of the name Kilimanjaro is disputed. Although the Chagga people of the Kilimanjaro region have no name for the mountain, they call its two peaks Kipoo and Kimawenze. The peaks' names—usually rendered Kibo and Mawenzi—mean “spotted” in reference to Kibo's snow and “broken top” due to Mawenzi's jagged peak.$$ 
),
(
  'Zanzibar',
  'zanzibar',
  'A tropical archipelago shaped by centuries of trade and cultural exchange.',
  $$People have lived in Zanzibar for 20,000 years. The earliest written accounts of Zanzibar began when the islands became a base for traders voyaging between the African Great Lakes, the Somali Peninsula, the Arabian Peninsula, Iran, and the Indian subcontinent. Unguja offered a protected and defensible harbour, so although the archipelago had few products of value, Omanis and Yemenis settled in what became Zanzibar City (Stone Town) as a convenient point from which to trade with towns on the Swahili Coast.

During the Age of Exploration, the Portuguese Empire was the first European power to gain control of Zanzibar, and kept it for nearly 200 years. In 1698, Zanzibar fell under the control of the Sultanate of Oman, which developed an economy of trade and cash crops, with a ruling Arab elite and a Bantu general population.

The islands gained independence from Britain in December 1963. A month later, the bloody Zanzibar Revolution led to the formation of the People's Republic of Zanzibar. That April, the republic merged with the mainland Tanganyika and became part of Tanzania, of which Zanzibar remains a semi-autonomous region.$$ 
),
(
  'Ngorongoro Crater',
  'ngorongoro',
  'A UNESCO World Heritage Site and one of the most remarkable volcanic calderas on Earth.',
  $$Ngorongoro is a protected area and a UNESCO World Heritage Site located in Ngorongoro District, within the Crater Highlands geological area of northeastern Tanzania. The area is named after Ngorongoro Crater, a large volcanic caldera within the area.

The conservation area also contains Olduvai Gorge, one of the most important paleoanthropological sites in the world. Based on fossil evidence found at the Olduvai Gorge, various hominid species have occupied the area for 3 million years.

The name of the crater has an onomatopoeic origin; it was named by the Maasai pastoralists after the sound produced by the cowbell (ngoro ngoro). Hunter-gatherers were replaced by pastoralists a few thousand years ago, and the area has a rich cultural history intertwined with the Maasai.$$ 
);

-- Images (URLs match the Vue public assets served from /legacy)
insert into place_images (place_id, url, alt_text, sort_order)
values
  ((select id from places where slug = 'serengeti'), '/serengeti pic1.jpg', 'Serengeti National Park', 0),
  ((select id from places where slug = 'serengeti'), '/serengeti pic2.jpg', 'Serengeti National Park', 1),
  ((select id from places where slug = 'serengeti'), '/serengeti pic3.jpg', 'Serengeti National Park', 2),
  ((select id from places where slug = 'serengeti'), '/serengeti pic4.jpg', 'Serengeti National Park', 3),
  ((select id from places where slug = 'serengeti'), '/serengeti pic5.jpg', 'Serengeti National Park', 4),
  ((select id from places where slug = 'serengeti'), '/serengeti pic 6.jpg', 'Serengeti National Park', 5),
  ((select id from places where slug = 'serengeti'), '/serengeti pic 7.jpg', 'Serengeti National Park', 6),

  ((select id from places where slug = 'kilimanjaro'), '/kill pic1.jfif', 'Mount Kilimanjaro', 0),
  ((select id from places where slug = 'kilimanjaro'), '/kill pic2.jfif', 'Mount Kilimanjaro', 1),
  ((select id from places where slug = 'kilimanjaro'), '/kill pic3.jfif', 'Mount Kilimanjaro', 2),
  ((select id from places where slug = 'kilimanjaro'), '/kill pic4.jfif', 'Mount Kilimanjaro', 3),

  ((select id from places where slug = 'zanzibar'), '/zanzibar pic1.webp', 'Zanzibar', 0),
  ((select id from places where slug = 'zanzibar'), '/zanzibar pic2.jpg', 'Zanzibar', 1),
  ((select id from places where slug = 'zanzibar'), '/zanzibar pc3.jpg', 'Zanzibar', 2),

  ((select id from places where slug = 'ngorongoro'), '/ngorongoro pic1.jfif', 'Ngorongoro Crater', 0),
  ((select id from places where slug = 'ngorongoro'), '/ngorongoro pic2.jfif', 'Ngorongoro Crater', 1),
  ((select id from places where slug = 'ngorongoro'), '/ngorongoro pic3.jfif', 'Ngorongoro Crater', 2),
  ((select id from places where slug = 'ngorongoro'), '/ngorongoro pic4.jpg', 'Ngorongoro Crater', 3);

insert into team_members (name, email, phone, reg_no, gender, bio)
values
  ('Daudi S. Daudi', 'dahoodshamsa@gmail.com', '0742 727 241', '02.7741.01.02.2023', 'Male', null),
  ('Nelson N. Wilson', 'novathwilson10@gmail.com', '0621 446 176', '02.0505.01.02.2023', 'Male', null),
  ('Ally R. Mohamed', 'kissuuramadhani@gmail.com', '0748 106 681', '02.4457.21.02.2022', 'Male', null);

