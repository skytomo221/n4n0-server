# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  world_guides = [
    [
      { vrchat_id: "usr_333ab5ee-2037-4817-9ed6-4930c966bb5d", name: "Kakulity_" },
      { vrchat_id: "wrld_6c40e9c5-3283-4c80-9f22-c50701961197", name: "楽園 ˸ Paradice" },
      { description: "Quiet", released_at: Time.zone.now, private: false },
      { tags: %w[Calm Sea Grasslands Chill Fog] }
    ],
    [
      { vrchat_id: "usr_68f13659-76ce-4308-bf18-84be3a40ffd6", name: "BBeaa" },
      { vrchat_id: "wrld_605578f2-76aa-4c30-b470-9347a7e0c421", name: "a rainy dream" },
      { description: "a rainy dream", released_at: Time.zone.now, private: false },
      { tags: [] }
    ],
    [
      { vrchat_id: "usr_cc67ef88-b256-4fa5-b89f-86bda566cd32", name: "ケト中佐" },
      { vrchat_id: "wrld_df596eec-e84b-4e06-ac11-53f2d3d9b0d7", name: "capital city Karl-Balar" },
      {
        description: <<~EOS,
          帝都カール・バラル 議事堂公園周り
          サークル「第六製鉄部」の世界観を形にしたワールド第一弾です。
          まだ完成状態ではありませんが「発達したスチームパンク」をコンセプトに作者脳内のイメージを放出した画作りに特化したワールドです。
          同世界観のアバターの展示・販売も行っています。
          arl-Balar Imperial City˸ Around the Parliament Park
          This is the first world created by the circle ＂The 6th Steel Division‚＂ bringing their unique worldview to life․
          While still a work in progress‚ this world is designed with a focus on visuals‚ built around the concept of an ＂advanced steampunk＂ aesthetic‚ reflecting the creator's imagination․
          Note˸ Avatars from the same worldview are also on display and available for purchase․
        EOS
        released_at: Time.zone.now, private: false
      },
      { tags: %w[Avatar Avatars City Steampunk] }
    ],
    [
      { vrchat_id: "usr_d364cf3d-3e6b-4d51-adfd-9d66ce5bd6fa", name: "Charlotte（シャル）" },
      { vrchat_id: "wrld_e02d39a2-6f41-4426-9b8b-3e52636da43e", name: "神域 ～ Charlotte's Sacred Island" },
      {
        description: <<~EOS,
          そこは神域へ至るゲート。
          これも「縁」。
          さあ進みましょう。
          鎮守の森を抜け、太陽の導きに従って。
          この長いトンネルを抜けた向こうに「明るい未来」があるのだから。
          ＃7DaysWorldWorks 出展作品 （Home ＆ 撮影用ワールド）"
        EOS
        released_at: Time.zone.now,
        private: false
      },
      { tags: %w[Home Shrine Sea Chill Whale] }
    ]
  ]
  world_guide_takens = [
    [
      Time.zone.local(2025, 1, 1, 23, 19, 30.388),
      Time.zone.local(2025, 1, 1, 23, 22, 12.985),
      Time.zone.local(2025, 1, 1, 23, 16, 13.161),
    ],
    [
      Time.zone.local(2025, 1, 5, 23, 16, 3.357),
      Time.zone.local(2025, 1, 5, 23, 12, 54.531),
      Time.zone.local(2025, 1, 5, 23, 14, 3.795),
    ],
    [
      Time.zone.local(2025, 1, 13, 01, 49, 56.903),
      Time.zone.local(2025, 1, 13, 01, 41, 35.085),
      Time.zone.local(2025, 1, 13, 02, 03, 8.435),
    ],
    [
      Time.zone.local(2025, 1, 15, 12, 02, 59.426),
      Time.zone.local(2025, 1, 15, 12, 11, 13.081),
      Time.zone.local(2025, 1, 15, 12, 07, 44.848),
    ]
  ]
  world_guides.each_with_index do |world_guide_params, i|
    world_guide = WorldGuide.create_with_associations(*world_guide_params)
    (1..3).each do |j|
      photo = Photo.create(
        image: ActiveStorage::Blob.create_and_upload!(
          io: File.open(Rails.root.join("db/fixtures/images/world_guides/sample#{i + 1}/#{j}.jpg")),
          filename: "sample#{i + 1}_#{j}.jpg",
        ),
        description: "#{world_guide.world.name} #{j}枚目の写真",
        taken_at: world_guide_takens[i][j - 1],
      )
      WorldGuidePhoto.create(world_guide:, photo:, display_order: j)
    end
  end
  portraits = {
    '1_1': [
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "1_1/1", description: "airari2005さんによるポートレート", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_c4d8ba67-1229-4052-90ea-916424f6d294", name: "takakong" }],
        { tags: %w[かわいい] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "1_1/2", description: "ecochinさんによるポートレート", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_3ada953c-75ea-4a7e-a3bf-389f4d4aef56", name: "ecochin" }],
        { tags: %w[きれい] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "1_1/3", description: "Unknown Userさんによるポートレート", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" }],
        { tags: %w[水彩] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "1_1/4", description: "なのくんさんによるポートレート", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" }],
        { tags: %w[かっこいい] }
      ]
    ],
    '3_2': [
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "3_2/1", description: "さんとりさんによるポートレート", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_5e556658-85de-4e1a-aaf2-1cbf28514ce6", name: "さんとり" }],
        { tags: %w[かっこいい 夕日] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "3_2/2", description: "なのくんさんによるポートレート 2", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" }],
        { tags: %w[かっこいい] }
      ]
    ],
    '4_3': [
      [
        { vrchat_id: "usr_f1ba63f9-a0cc-4c4d-9ee1-49e3ebaa3aeb", name: "yuri_ts" },
        { vrchat_id: "wrld_7ef1fa95-a823-46ee-b9f6-bcb4d5657853", name: "wind power plant" },
        { title: "4_3/1 みんなで撮影しよう", description: "みんなによるポートレート", released_at: Time.zone.now, private: false },
        [
          { vrchat_id: "usr_5f899b41-36fa-4cb7-85a6-210e415329e9", name: "Minataミナタ" },
          { vrchat_id: "usr_c4d8ba67-1229-4052-90ea-916424f6d294", name: "takakong" },
          { vrchat_id: "usr_377272ce-55b0-416d-8c6b-1ffde7aadd21", name: "白蛇⁄Hakuja" },
          { vrchat_id: "usr_d27b7bed-9d44-44c0-8f14-84aee9605002", name: "うなぎ99" },
          { vrchat_id: "usr_c48dd68e-707d-4b75-aa07-64678c072226", name: "monolith_" },
          { vrchat_id: "usr_7e60570e-38c4-45f3-9a93-aecb3ef6fa33", name: "Ausren" },
          { vrchat_id: "usr_d1fbfe62-a37e-44a5-884b-71cc6b5717d7", name: "yamanoki" },
          { vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" },
          { vrchat_id: "usr_fa23e512-d848-487f-b952-a1ae75f206b1", name: "かいわし（Kaiwash）" },
          { vrchat_id: "usr_dfac1d4a-54c6-4ba0-8641-3d985c3c1b24", name: "MILLY_みりー" },
          { vrchat_id: "usr_f8e0fd8a-55ac-4a4a-ae2e-b64efefc86bc", name: "-ᴀᴋɪᴀᴋɪ-" },
          { vrchat_id: "usr_94a48513-9ddf-4644-8ac9-e624f16d9eea", name: "sayonara_sanpo" },
          { vrchat_id: "usr_291c3f36-29d6-4d7f-bbc9-2eee14856256", name: "Nakamuraaa" },
          { vrchat_id: "usr_0e2aba1e-7904-476f-bb85-0749043af3a0", name: "山瀬アヒロ" },
          { vrchat_id: "usr_af417c82-74e3-42b8-bfc4-d8b831dcb734", name: "SoBax" },
          { vrchat_id: "usr_6615040a-58b8-4d04-a542-dd1fe70e9a37", name: "heysQAQ" },
          { vrchat_id: "usr_fef9269a-9817-4044-ad44-dbf69b010a98", name: "Koba Poko" },
          { vrchat_id: "usr_6afab238-75e2-44e9-a903-fc94fd8d8284", name: "edcee3000" },
          { vrchat_id: "usr_48760018-ed3b-47de-ac9a-90d3aff736e3", name: "Maxgoud" },
          { vrchat_id: "usr_301ea1cb-d840-45e0-8c53-4c08d55c6839", name: "Aipo" }
        ],
        { tags: %w[かわいい きれい かっこいい] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "4_3/2", description: "なのさんによるポートレート 3", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" }],
        { tags: %w[かっこいい かわいい] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "4_3/3", description: "なのさんによるポートレート 4", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" }],
        { tags: %w[かっこいい かわいい] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "4_3/4", description: "誰かさんのポートレート", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" }],
        { tags: %w[かっこいい かわいい] }
      ],
    ],
    '16_9': [
      [
        { vrchat_id: "usr_41b1d197-bdc8-442f-8f8a-5b2adc3fa973", name: "RootGentle" },
        { vrchat_id: "wrld_b2d24c29-1ded-4990-a90d-dd6dcc440300", name: "Japan Shrine［winter］" },
        { title: "16_9/1", description: "RootGentleさんによるポートレート", released_at: Time.zone.now, private: false },
        [
          { vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" },
          { vrchat_id: "usr_c4d8ba67-1229-4052-90ea-916424f6d294", name: "takakong" },
        ],
        { tags: %w[かわいい おみくじ] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "16_9/2", description: "なのくんさんによるポートレート 5", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" }],
        { tags: %w[かわいい] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "16_9/3", description: "なのくんさんによるポートレート 6", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" }],
        { tags: %w[かわいい きれい] }
      ],
      [
        { vrchat_id: "usr_00000000-0000-0000-0000-000000000000", name: "Unknown User" },
        { vrchat_id: "wrld_00000000-0000-0000-0000-000000000000", name: "Unknown World" },
        { title: "16_9/4", description: "なのくんさんによるポートレート 7", released_at: Time.zone.now, private: false },
        [{ vrchat_id: "usr_2eab2748-6d41-4994-ab61-f1256b6960df", name: "なのくん" }],
        { tags: %w[かわいい きれい] }
      ]
    ]
  }
  portraits.each do |ratio, portraits_inter|
    portraits_inter.each_with_index do |portraits_params, index|
      photo = Photo.create(
        image: ActiveStorage::Blob.create_and_upload!(
          io: File.open(Rails.root.join("db/fixtures/images/portraits/#{ratio}/#{index + 1}.jpg")),
          filename: "#{ratio}_#{index + 1}.jpg",
        ),
        description: "#{portraits_params[2][:description]}さんによるポートレート",
        taken_at: Time.zone.now
      )
      photo_params = { id: photo.id }
      Portrait.create_with_associations(*portraits_params[..1], photo_params, *portraits_params[2..])
    end
  end
end
