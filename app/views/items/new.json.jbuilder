if params[:parent_id] != nil && params[:parent_id_two] == nil
  json.array! @children do |child|
    json.id child.id
    json.name child.name
    json.ancestry child.ancestry
  end
end

if params[:parent_id] == nil && params[:parent_id_two] != nil
  json.array! @children_two do |child_two|
    json.id child_two.id
    json.name child_two.name
    json.ancestry child_two.ancestry
  end
end
  