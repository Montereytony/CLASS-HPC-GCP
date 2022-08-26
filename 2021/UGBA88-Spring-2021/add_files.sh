mkdir -p $HOME/my-work
mkdir -p $HOME/.ssh
mkdir -p $HOME/.jupyter
mkdir -p $HOME/.jupyter/custom
rm  -f $HOME/.jupyter/custom.css
rm  -f $HOME/.jupyter/custom/custom.css
cp -n /tmp/custom.css    $HOME/.jupyter/custom.css
cp -n /tmp/custom.css    $HOME/.jupyter/custom/custom.css
cp -n /tmp/common.json   $HOME/.jupyter/common.json
cp -n /tmp/tree.json     $HOME/.jupyter/tree.json
cp -n /tmp/notebook.json $HOME/.jupyter/notebook.json
cp -n /tmp/common.json   $HOME/.jupyter/custom/common.json
cp -n /tmp/tree.json     $HOME/.jupyter/custom/tree.json
cp -n /tmp/notebook.json $HOME/.jupyter/custom/notebook.json
rm -f $HOME/.ssh/id_ed25519
cp -n  /tmp/id_ed25519    $HOME/.ssh/id_ed25519
cp -n  /tmp/known_hosts    $HOME/.ssh/known_hosts
chmod 400  $HOME/.ssh/id_ed25519
