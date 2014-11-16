# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


    @logan = Leader.create(first_name: "Logan", last_name: "Watanabe", date_of_birth: 20.years.ago.to_date, specialty: "Fitness", phone: "8084977749", female: false)
    @nick = Leader.create(first_name: "Nick", last_name: "Deng", date_of_birth: 23.years.ago.to_date, specialty: "Music", phone: "8081234567", female: false)
	@monica = Leader.create(first_name: "Monica", last_name: "Foolsey", date_of_birth: 26.years.ago.to_date, specialty: "Arts & Crafts", phone: "8085550011", female: true)
	@bt = Leader.create(first_name: "Bryce", last_name: "Tomato", nickname: "BT", date_of_birth: 29.years.ago.to_date, specialty: "Fitness", phone: "8081116969", female: false)
	@jp = Leader.create(first_name: "Janice", last_name: "Perrigo", nickname: "JP", date_of_birth: 18.years.ago.to_date, specialty: "Sports & Games", phone: "8086431111", female: true)


    @group1 = Group.create(:name => "Group 1", leader_id: @monica.id, :rotation => 1)
    @group4 = Group.create(:name => "Group 4", leader_id: @logan.id, :rotation => 2)
    @group2 = Group.create(:name => "Group 2", leader_id: @jp.id, :rotation => 1)
    @office = Group.create(:name => "Office", leader_id: @nick.id, :rotation => 3)
    @group3 = Group.create(:name => "Group 3", leader_id: @bt.id, :rotation => 2)

    #children
    @timmy = Participant.create(role: 'child', group_id: @group3.id, first_name: "Timmy", last_name: "Toddler", nickname:  nil, date_of_birth: 11.years.ago.to_date, grade: 4, notes: nil, role: 'child', female: false, school: "Manoa Elementary", active: nil)
    @adam = Participant.create(role: 'child', first_name: "Adam", last_name: "Adamson", date_of_birth: 5.years.ago.to_date, grade: 0, group_id: @group1.id, nickname:  nil, female: false, school: "Manoa Elementary")
    @betty = Participant.create(role: 'child', first_name: "Betty", last_name: "Bettle", date_of_birth: 10.years.ago.to_date, grade: 3, group_id: @group3.id, female: true, nickname:  nil, school: "Punahou")
    @eric = Participant.create(role: 'child', first_name: "Eric", last_name: "Ernie", date_of_birth: 10.years.ago.to_date, grade: 5, group_id: @group4.id, nickname:  nil, female: false, school: "Iolani")
    @annie = Participant.create(role: 'child', first_name: "Annie", last_name: "Anderson", date_of_birth: 7.years.ago.to_date, grade: 1, group_id: @group2.id, female: true, nickname:  nil, school: "Noelani Elementary")
    @benny = Participant.create(role: 'child', first_name: "Benny", last_name: "Benson", nickname: "Ben", date_of_birth: 8.years.ago.to_date, grade: 2, group_id: @group2.id, female: false, school: "Manoa Elementary")

    #junior leaders
    @yi = Participant.create(role: 'junior', first_name: "Yi", last_name: "Young", nickname: "Jack", date_of_birth: 13.years.ago.to_date, grade: 9, group_id: @group2.id, female: false, school: "Roosevelt")
    @gina = Participant.create(role: 'junior', first_name: "Gina", last_name: "Goldberg", date_of_birth: 12.years.ago.to_date, grade: 7, group_id: @group3.id, female: true, nickname:  nil, school: "Iolani")
    @zach = Participant.create(role: 'junior', first_name: "Zach", last_name: "Zoidberg", date_of_birth: 15.years.ago.to_date, grade: 10, group_id: @group1.id, nickname:  nil, female: false, school: "Stevenson")
    @sam = Participant.create(role: 'junior', first_name: "Sam", last_name: "Sampson", date_of_birth: 16.years.ago.to_date, grade: 10, group_id: @group4.id, nickname:  nil, female: false, school: "Kalani")
    @oren = Participant.create(role: 'junior', first_name: "Oren", last_name: "Ogletree", date_of_birth: 18.years.ago.to_date, grade: 11, group_id: @office.id, nickname:  nil, female: false, school: "Maryknoll")

