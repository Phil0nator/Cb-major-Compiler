echo "Linux:"
python3.8 compile.py include/cblib_compile.cb -o include/cblib-linux -c -O3 -v
#echo "Darwin:"
#python3.8 compile.py include/cblib_compile.cb -o include/cblib-bsd   -c -O3 --platform Darwin -v
#echo "Compiled both libraries"