class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, :inclusion => { :in => ["male","female"] }

  validate :both_names_not_null, :boy_not_named_sue

 def both_names_not_null
    if first_name.blank? and last_name.blank?
      errors.add(:first_name, "first_name and last_name cannot both be empty")
      errors.add(:last_name, "first_name and last_name cannot both be empty")
    end
  end

  def boy_not_named_sue
    if !first_name.blank? and first_name == 'Sue' and gender == 'male'
      errors.add(:gender, "what did you do? a boy named sue!")
    end
  end

  def Profile::get_all_profiles(min=nil, max=nil)
    q = "SELECT * FROM profiles "
    o = " ORDER BY birth_year"
    if !min.blank? && !max.blank?
      find_by_sql([q + " WHERE birth_year > ? AND birth_year < ?" + o, min, max])
    elsif !min.blank?
      find_by_sql([q + " WHERE birth_year > ?" + o, min])
    elsif !max.blank?
      find_by_sql([q + " WHERE birth_year < ?" + o, max])
    else
      find_by_sql(q + o)
    end
  end
end
