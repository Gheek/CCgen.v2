echo $(pwd)
#create tmp directory and copy all files
mkdir release/tmp
cp -r ccgen  release/tmp
cp -r docs release/tmp
cp -r listener release/tmp
mkdir release/tmp/messages
cp -r out release/tmp
cp -r pcaps release/tmp
cp -r spammer release/tmp
cp install.sh release/tmp
cp README.md release/tmp
cp requirements.txt release/tmp
cp run.sh release/tmp

#remove unnecessary files
rm -r release/tmp/ccgen/__pycache__/
rm release/tmp/ccgen/data/ccgen_data.db
rm -r release/tmp/ccgen/util/__pycache__/
rm -r release/tmp/ccgen/wrapper/__pycache__/
rm -r release/tmp/ccgen/wrapper/go-flows-master/*
rm -r release/tmp/ccgen/wrapper/temp/*
rm -r release/tmp/listener/__pycache__/
rm -r release/tmp/out/*
rm -r release/tmp/pcaps/*
cp pcaps/empty.pcap release/tmp/pcaps/
rm -r release/tmp/spammer/__pycache__/
rm -r release/tmp/spammer/.vagrant
rm -r release/tmp/spammer/Vagrantfile

#create tar.gz
CODE=$(date +%s)
cd release/tmp
tar -czvf $(pwd)/../CCgen.v2_$CODE.tar.gz * 

#remove tmp folder
rm -r ../tmp