# retrieve the CPU vendor information
vendor=$(lscpu | awk '/Vendor ID/{print $3}')
# ALTERNATIVE cat /proc/cpuinfo | grep "vendor_id"

# print out the result 
if [[ "$vendor" == "GenuineIntel" ]]; then
   echo "Intel CPU"
elif [[ "$vendor" == "AuthenticAMD" ]]; then
   echo "AMD CPU"
else
    echo "CPU vendor: $vendor"
fi
