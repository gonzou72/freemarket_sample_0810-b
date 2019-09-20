if params[:parent_id] != nil
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

if params[:size] != nil
  json.id @size
  json.id_two @size_two
  json.id_three @size_three
end
  
if params[:delivery] != nil
  json.way @delivery
end