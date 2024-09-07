#move all files from current folder to destination 
sudo find . -maxdepth 1 -type f | xargs -I {} sudo mv {} /abc/def/
# This command moves each file individually. While it will be slower in execution since it runs a separate mv command for each file, it avoids the issue of overloading the system.
sudo find . -maxdepth 1 -type f -exec mv {} /abc/def/ \;
# The + at the end will gather as many files as possible and move them in a single mv command, making it more efficient than running separate mv commands for each file.
sudo find . -maxdepth 1 -type f -exec mv -t /abc/def/ {} +
# This command moves the first 1,000 files at a time. 
sudo find . -maxdepth 1 -type f | head -n 1000 | xargs -I {} sudo mv {} /abc/def/

# as batch
sudo find . -maxdepth 1 -type f | xargs -L 10000 -I {} sudo mv {} /abc/def/

###
#move files from current folder to destination folder
sudo mv * /abc/def/
#go up for 1 step , and to abc folder
sudo mv * ../abc/def/ 
###

#print folder and number of files that folder has
for dir in */; do echo "$dir: $(find "$dir" -type f | wc -l) files"; done

###
#remove files in current folder 
sudo find . -maxdepth 1 -type f -print0 | sudo xargs -0 rm -f
# to remove all "files" in current folder (if not many)
sudo rm *

###
#find number of files in current folder 
ls -1 | wc -l 

###
#print newest 5 files in current folder
ls -lt | head -n 6 | tail -n 5

# print oldest 5 files in current folder
ls -ltr | head -n 5



# To remove all the content of the current folder, including all subfolders and their contents
rm -rf ./*


#finds the oldest file in the directory - sorted by modification timestamps
find /abc/def/  -type f -printf '%T+ %p\n' | sort | head -n 1


#displays unique file extensions in dir
find /abc/def/ -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u


# lists all active system services and filter name contain "myservice" or "abc"
systemctl list-units --type=service | egrep 'myservice|abc'


