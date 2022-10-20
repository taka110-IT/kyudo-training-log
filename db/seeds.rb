# frozen_string_literal: true

User.create!(email: 'user1@user.com', password: 'useruser')

Practice.create!(
  [
    {
      date: '2022-9-1',
      shooting_count: 20,
      memo: '明日の試合では、しっかり狙うこと。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-2',
      shooting_count: 8,
      memo: '1回皆中を出したが、狙いきれずに離してしまうことがあった。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-7',
      shooting_count: 12,
      memo: '疲れていて思うように引けなかった。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-8',
      shooting_count: 20,
      memo: '三重十文字が大三で崩れ、弓手肩が出てしまうので気を付ける。<br>早気にならないよう、しっかり伸びること。',
      fixed: false,
      important: true,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-10',
      shooting_count: 20,
      memo: '手先に力が入っている。大三で少し力を抜くよう意識できるか試してみる。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-15',
      shooting_count: 10,
      memo: '',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-16',
      shooting_count: 10,
      memo: '今日はいまいちだった。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-17',
      shooting_count: 40,
      memo: '久しぶりに矢数をかけた。途中、雑になりがちだったので、矢数をかける時も１射１射を丁寧に引くこと。',
      fixed: false,
      important: true,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-20',
      shooting_count: 10,
      memo: '審査が近いけどなかなか上手くいかず。焦ってきた。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-24',
      shooting_count: 28,
      memo: '明日は審査だが上手くいかないので時間いっぱいまで引いた。明日はかなり不安。できることをやりたい。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-9-25',
      shooting_count: 2,
      memo: '審査は✖️✖️だった。昨日の状態から見れば当然の結果のような気がする。来週は講習会なので色々教わってこよう。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-1',
      shooting_count: 20,
      memo: '1射1射丁寧に引くこと。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-2',
      shooting_count: 2,
      memo: '今日は講習会だった。引いた本数は少ないが学びは多かった。月末の審査に向けて教わったことをしっかり身につけていこうと思う。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-3',
      shooting_count: 10,
      memo: '教わったことを確認しながら丁寧に引くこと。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-4',
      shooting_count: 10,
      memo: '',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-6',
      shooting_count: 10,
      memo: '中りは戻らないが、会から離れの感触は良くなってきている。引き続き。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-10',
      shooting_count: 20,
      memo: '中りを気にせずに、引分け・会・離れを繋げていく意識を持つこと。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-11',
      shooting_count: 20,
      memo: '引き続き丁寧に、確認しながら引くこと。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-12',
      shooting_count: 8,
      memo: '今日は道場には行けたがあまり時間が取れなかった。少し引けただけでも良しとする。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-15',
      shooting_count: 40,
      memo: '今日は矢数をかけられた。疲れてくると雑になったり、途中でやっていることに迷いが出てきたりする。講習会で教わったことを再確認して1射1射丁寧に引くことを忘れないように。',
      fixed: false,
      important: true,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-16',
      shooting_count: 8,
      memo: '今日は射会だった。結果は羽分けだったが、自分のやっていることをちゃんとできたと思う。この調子で！',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-17',
      shooting_count: 12,
      memo: '昨日の射が嘘のように崩れた感じがする。焦らずにやっていることをもう一度確認する。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-18',
      shooting_count: 4,
      memo: '今日は座射で引いた。矢数はかけられないが、気合を入れて練習することができた。おかげで昨日より少しは良くなったかもしれない。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-19',
      shooting_count: 4,
      memo: '昨日に引き続き座射で引いた。矢数が足りない分は質でカバーする！',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-20',
      shooting_count: 20,
      memo: '今日は立射で。座射より矢数はかけられるが、気合はいまひとつ。立射でも気合をそのままで引く方法はないものか…。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-21',
      shooting_count: 8,
      memo: '疲れていたので練習に身が入らず。無理しすぎない程度で終了。たまにはしょうがない。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-22',
      shooting_count: 12,
      memo: 'かなり気合が入った練習ができた。休息は大事。',
      fixed: false,
      important: true,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-23',
      shooting_count: 30,
      memo: '来週は審査なので、今日は矢数をかけた。教わったことが少しは身についているような気がする。あと1週間がんばろう！',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-25',
      shooting_count: 20,
      memo: '雑にならないように。息合いをおろそかにしないこと。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-26',
      shooting_count: 30,
      memo: '今日はだいぶ引けた。審査のことを考えて、明日からは本番を想定して気合を入れて引く。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-27',
      shooting_count: 4,
      memo: '他の人に協力してもらって審査の間合いで練習した。うっかり弓を立てるタイミングを間違えそうになった。気合が足りない！',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-28',
      shooting_count: 4,
      memo: '昨日に引き続き審査の間合いで。息合いをちゃんとやれば気合も乗ってくる。動作を急がないこと。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-29',
      shooting_count: 2,
      memo: '審査前最後の練習。本番を想定して一手で切り上げた。明日は自分のやってきたことを出し切ろうと思う。',
      fixed: false,
      important: false,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    },
    {
      date: '2022-10-30',
      shooting_count: 2,
      memo: '審査は〇〇で合格できた！嬉しい！1ヶ月取り組んできたことを出し切って引くことができた。次のステップに向かってこれからもがんばるぞ！！',
      fixed: true,
      important: true,
      created_at: '2022-10-19',
      updated_at: '2022-10-19',
      user_id: 1
    }
  ]
)

Target.create!(
  [
    {
      total: 200,
      year: 2022,
      month: 9,
      user_id: 1
    },
    {
      total: 250,
      year: 2022,
      month: 10,
      user_id: 1
    }
  ]
)
