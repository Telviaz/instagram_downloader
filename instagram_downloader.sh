#created by 𝐌𝐀𝐓𝐑𝐀𝐗𝐗 𝐂𝐎𝐃𝐄𝐑𝐒
#owner 𝐓𝐄𝐋𝐕𝐈𝐍 𝐓𝐄𝐔𝐌 

#!/bin/bash


echo "==================================================="

echo "          MATRAXX CODERS - INSTAGRAM DOWNLOADER     "

echo "==================================================="

# Install instaloader if not already installed

if ! command -v instaloader &> /dev/null

then

    echo "instaloader not found. Installing..."

    pip install instaloader

fi

# Get user input for Instagram username

read -p "Enter Instagram username: " username

# Create a directory to store downloaded data

if [ ! -d "$username" ]

then

    mkdir "$username"

fi

# Get user input for what to download

while true; do

    echo "Choose what to download:"

    echo "1. Posts"

    echo "2. Stories"

    echo "3. Profile details"

    echo "4. Profile picture"

    echo "5. Highlights"

    echo "6. IGTV videos"

    echo "7. Followers list"

    echo "8. Following list"

    echo "9. Quit"

    read -p "Enter option number: " option

    case $option in

        1)

            echo "Downloading posts..."

            instaloader --no-videos --no-metadata --dirname-pattern="$username/posts" -- -T "$username"

            echo "Posts downloaded to: $username/posts/"

            ;;

        2)

            echo "Downloading stories..."

            instaloader --no-metadata --no-pictures --no-videos --dirname-pattern="$username/stories" --stories "$username"

            echo "Stories downloaded to: $username/stories/"

            ;;

        3)

            echo "Downloading profile details..."

            instaloader --no-videos --no-metadata --dirname-pattern="$username" -- -P profile-details "$username"

            echo "Profile details downloaded to: $username/"

            ;;

        4)

            echo "Downloading profile picture..."

            instaloader --no-captions --no-videos --no-metadata --dirname-pattern="$username" -- -P profile-picture "$username"

            echo "Profile picture downloaded to: $username/"

            ;;

        5)

            echo "Downloading highlights..."

            instaloader --no-metadata --no-videos --dirname-pattern="$username/highlights" --highlights "$username"

            echo "Highlights downloaded to: $username/highlights/"

            ;;

        6)

            echo "Downloading IGTV videos..."

            instaloader --no-metadata --no-videos --dirname-pattern="$username/igtv" --igtv "$username"

            echo "IGTV videos downloaded to: $username/igtv/"

            ;;

        7)

            echo "Downloading followers list..."

            instaloader --no-metadata --no-videos --dirname-pattern="$username/followers" -- -F "$username"

            echo "Followers list downloaded to: $username/followers/"

            ;;

        8)

            echo "Downloading following list..."

            instaloader --no-metadata --no-videos --dirname-pattern="$username/following" -- -f "$username"

            echo "Following list downloaded to: $username/following/"

            ;;

        9)

            echo "Quitting..."

            exit 0

            ;;

        *)

            echo "Invalid option. Please choose again."

            ;;

    esac

done

