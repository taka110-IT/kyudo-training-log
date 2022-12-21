module PracticesHelper
  def practice_important?(practice)
    practice.important == true ? '⭐️' : ''
  end

  def practice_fixed?(practice)
    practice.fixed == true ? '📌' : ''
  end

  def practice_shooting_count_blank?(practice)
    if practice.shooting_count.blank?
      t('views.index.shooting_counts', count: 0)
    else
      t('views.index.shooting_counts', count: practice.shooting_count)
    end
  end

  def practice_memo_blank?(practice)
    practice.memo.presence || t('views.show.no_memos')
  end
end
