if params[:parent_id] != nil
  json.array! @children do |child|
    json.id child.id
    json.id child.name
    json.id child.ancestry
  end
end

# if params[:parent_id_two] != nil
#   json.array! @children do |child|
#   json.id child.parent_id_two
#   end
# end
  