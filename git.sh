
search_dir="../"

repoName="$1"

# Second parameter provided by the user
token="$2"


find "$search_dir" -type d -wholename "*/cnyp*/lambda" | while read -r dir; do
    if [ -f "$dir/createRepo.sh" ]; then
        echo "Running script in directory: $dir"
        bash "$dir/createRepo.sh" "$repoName" "$token"
    else
        echo "No script found in directory: $dir"
    fi
done
