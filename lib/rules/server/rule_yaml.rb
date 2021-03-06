require "#{Rails.root}/lib/rules/server/rule"
require "#{Rails.root}/lib/rules/server/result"

class YamlRule < Rule
  @source = :yaml

  def source
    self.class.source
  end

  def initialize(name, entry)
    @@current_rule = name
    @name = name.to_sym
    @entry = entry
    @description = entry['description']
    @hidden = entry['hidden'] || false
    @majors = entry['majors'] || []
    @colleges = entry['colleges'] || []
    @university = entry['university'] || false
    @core = false
    @rule, @args = Rule.parse_entry @entry
  end

  def check(plan, args)
    fail ArgumentError,
      "YAML rules should not take arguments, got #{args.inspect}" unless args.nil?
    result = Result.new self, false
    subresult = @rule.check plan, @args
    result.courses = subresult.courses
    result.pass = subresult.pass
    result.subresults << subresult
    result
  end
end
