require "csv"

CSV.foreach("db/csv/2023_03_31_bicycle_parking_list.csv", headers: true, encoding: "utf-8") do |row|
  bicycle_capacity = (row["自転車収容台数"] == "-") ? 0 : row["自転車収容台数"].to_i
  motorized_bicycle_under_50cc_capacity = (row["50cc以下の原動機付自転車収容台数"] == "-") ? 0 : row["50cc以下の原動機付自転車収容台数"].to_i
  motorized_bicycle_under_125cc_capacity = (row["125cc以下の原動機付自転車収容台数"] == "-") ? 0 : row["125cc以下の原動機付自転車収容台数"].to_i
  bicycle_and_motorized_bicycle_under_50cc_capacity = (row["自転車・50cc以下の原動機付自転車収容台数"] == "-") ? 0 : row["自転車・50cc以下の原動機付自転車収容台数"].to_i
  motorcycle_price = (row["自動二輪車料金"] == "-") ? "" : row["自動二輪車料金"]
  BicycleParking.create!(
    name: row["名称"],
    location: row["所在地"],
    opening_hours: row["開場時間"],
    bicycle_capacity: bicycle_capacity,
    motorized_bicycle_under_50cc_capacity: motorized_bicycle_under_50cc_capacity,
    motorized_bicycle_under_125cc_capacity: motorized_bicycle_under_125cc_capacity,
    bicycle_and_motorized_bicycle_under_50cc_capacity: bicycle_and_motorized_bicycle_under_50cc_capacity,
    motorcycle_capacity: row["自動二輪車収容台数"].to_i,
    motorcycle_price: motorcycle_price,
    latitude: row["緯度"],
    longitude: row["経度"],
    published: true
  )
end
