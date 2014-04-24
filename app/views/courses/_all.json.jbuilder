json.array! @courses do |course|
  json.id course.id
  json.name course.search_name
  json.dept course.search_dept
  json.number course.number
  json.postfix course.postfix
  json.units course.units
  json.tagged_with course.rule_list
  json.drag true
end