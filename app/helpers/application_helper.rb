# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: '弓道練習記録帳',
      reverse: true,
      charset: 'utf-8',
      description: '弓道練習記録帳は、弓道の練習の記録管理・集計アプリです。手軽に練習記録の入力ができ、過去の練習メモや月間の練習量の確認ができます。'
    }
  end
end
