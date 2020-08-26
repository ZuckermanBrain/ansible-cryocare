function cryocare() {
	DATADIR=${1}
	if [ -z ${DATADIR} ]; then
		echo Data directory not specified.
		echo Usage:
		echo cryocare /path/to/data/directory
		echo NOTE: Data directory should contain a directory structure that mirrors the one listed at https://github.com/juglab/cryoCARE_T2T
		echo "(i.e., Tomo110, frames, imod)"
		return
	fi
	LD_LIBRARY_PATH=/.singularity.d/libs:${LD_LIBRARY_PATH}
	singularity run --nv -B /opt/cryocare/user:/run/user -B /opt/cryocare/example/:/notebooks -B ${DATADIR}:/data /opt/cryocare/cryoCARE_v0.1.1.simg
	unset LD_LIBRARY_PATH
}
