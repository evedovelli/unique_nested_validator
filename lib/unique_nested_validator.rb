class UniqueNestedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if not attribute.empty?
      with = options[:with] || :id
      if value.collect{|c| c[with]}.uniq.length != value.length
        record.errors.add(attribute, options[:message] || "#{I18n.t('unique_nested_validator.errors.cannot_repeat', default: 'cannot repeat')} #{I18n.t(with.to_s.pluralize, scope: [:unique_nested_validator, :keys], default: with.to_s.pluralize)}")
      end
    end
  end
end
