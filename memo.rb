
require "csv"
puts "1(新規でメモを作成)  2(既存のメモを編集する)"

memo_type = gets.to_i

if memo_type == 1       #メモ新規作成の処理
    #作成ファイル名の入力
    puts "新規で作成するメモの名前を入力してください。（拡張子を除く）"
    memo_name = gets.chomp
    puts "#{memo_name}.csv"

    #メモの内容記述
    puts "記載内容を記述してください。"
    puts "記述後、【Enter】で内容を出力します。"
    memo_text = gets.to_s

    #メモの内容をcsvファイルに入力
    CSV.open("#{memo_name}.csv","w") do |csv|
        csv << ["#{memo_text}"]
    end

elsif memo_type == 2        #既存メモを編集
    #既存ファイルの読み込み
    puts "既存のファイル名を入力してください。（拡張子を除く）"
    memo_name = gets.chomp
    CSV.foreach("#{memo_name}.csv") do |text|
        puts text
    end

    puts "追加する内容を記述してください。"
    puts "記述後、【Enter】で内容を追記します。"
    memo_text = gets.to_s
    CSV.open("#{memo_name}.csv","a") do |csv|
        csv << ["#{memo_text}"]
    end
end

