#!/usr/bin/env bash
cd ../1_InputTransformer
npm run start
cd ../2_CodeProducer
npm run start
cd ../6_Deployer
npm run start



search_dir="../"

repoName="$1"
token="$2"


find "$search_dir" -type d -wholename "*/cnyp*/lambda" | while read -r dir; do
    if [ -f "$dir/createRepo.sh" ]; then
        echo "Running script in directory: $dir"
        bash "$dir/createRepo.sh" "$repoName" "$token" "$dir"
    else
        echo "No script found in directory: $dir"
    fi
done
