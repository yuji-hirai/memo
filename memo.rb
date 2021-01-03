require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

if memo_type == 1
	puts "拡張子を除いたファイルを入力してください"
	file_name = gets.chomp
	puts "メモしたい内容を記入してください"
	puts "完了したらCtrl + Dを押します"

	memo_content = readlines
	CSV.open("#{file_name}.csv", 'w+') do |csv|
		csv << memo_content
end

elsif memo_type == 2
	puts "編集したいCSVのファイル名を入力してください（拡張子除く）"
	file_name = gets.chomp
	puts""
	puts""
	puts "現在の#{file_name}.csvファイルの入力内容"
	puts"----------------------------------"
	puts CSV.read("#{file_name}.csv")
	puts"----------------------------------"
	puts "メモしたい内容を追記してください"
	puts "完了したらCtrl + Dを押してください"
	puts""
	editings = readlines(chomp: true)
	CSV.open("#{file_name}.csv", 'a+') do |csv|
		csv << editings

end

else
	puts "1か2を入力してください。最初に戻ります"
end