@echo off
rem --- 
rem ---  �f���f�[�^����[�x������s��
rem --- 

rem ---  �J�����g�f�B���N�g�������s��ɕύX
cd /d %~dp0

rem ---  ���͑Ώۉf���t�@�C���p�X
echo Openpose�ŉ�͂����f���̃t�@�C���̃t���p�X����͂��ĉ������B
echo ���̐ݒ�͔��p�p�����̂ݐݒ�\�ŁA�K�{���ڂł��B
set INPUT_VIDEO=
set /P INPUT_VIDEO=����͑Ώۉf���t�@�C���p�X: 
rem echo INPUT_VIDEO�F%INPUT_VIDEO%

IF /I "%INPUT_VIDEO%" EQU "" (
    ECHO ��͑Ώۉf���t�@�C���p�X���ݒ肳��Ă��Ȃ����߁A�����𒆒f���܂��B
    EXIT /B
)

rem ---  ��͌���JSON�f�B���N�g���p�X
echo Openpose�̉�͌��ʂ�JSON�f�B���N�g���̃t���p�X����͂��ĉ������B({���於}_json)
echo ���̐ݒ�͔��p�p�����̂ݐݒ�\�ŁA�K�{���ڂł��B
set OPENPOSE_JSON=
set /P OPENPOSE_JSON=����͌���JSON�f�B���N�g���p�X: 
rem echo OPENPOSE_JSON�F%OPENPOSE_JSON%

IF /I "%OPENPOSE_JSON%" EQU "" (
    ECHO ��͌���JSON�f�B���N�g���p�X���ݒ肳��Ă��Ȃ����߁A�����𒆒f���܂��B
    EXIT /B
)

rem ---  �[�x���茋�ʃf�B���N�g���p�X
echo ���ɐ[�x������s������������ꍇ�A�[�x���茋�ʃf�B���N�g���̃t���p�X����͂��ĉ������B({���於}_json_{����}_depth)
echo ���̐ݒ�͔��p�p�����̂ݐݒ�\�ł��B
echo �f�B���N�g�����ɐ[�x�t�@�C��������ꍇ�A�[�x���茋�ʂ����̃t�@�C������ǂݎ��܂��B
set PAST_DEPTH_PATH=
set /P PAST_DEPTH_PATH=���[�x���茋�ʃf�B���N�g���p�X: 

rem ---  �[�x����Ԋu
echo --------------
set DEPTH_INTERVAL=10
echo �[�x������s���t���[���̊Ԋu�𐔒l�œ��͂��ĉ������B
echo �l���������قǁA�ׂ����[�x������s���܂��B�i���̕��A���Ԃ�������܂��j
echo �������͂����AENTER�����������ꍇ�A�u%DEPTH_INTERVAL%�v�Ԋu�ŏ������܂��B
set /P DEPTH_INTERVAL="���[�x����Ԋu: "

rem ---  �f���ɉf���Ă���ő�l��

echo --------------
echo �f���ɉf���Ă���ő�l������͂��ĉ������B
echo �������͂����AENTER�����������ꍇ�A1�l���̉�͂ɂȂ�܂��B
echo �����l���������x�̑傫���ŉf���Ă���f����1�l�����w�肵���ꍇ�A��͑Ώۂ���ԏꍇ������܂��B
set NUMBER_PEOPLE_MAX=1
set /P NUMBER_PEOPLE_MAX="���f���ɉf���Ă���ő�l��: "

rem ---  ��͂��I������t���[��

echo --------------
echo ��͂��I������t���[��No����͂��ĉ������B(0�n�܂�)
echo ���]�⏇�Ԃ𒲐�����ۂɁA�Ō�܂ŏo�͂����Ƃ��������I�����Č��ʂ����邱�Ƃ��ł��܂��B
echo �������͂����AENTER�����������ꍇ�A�Ō�܂ŉ�͂��܂��B
set FRAME_END=-1
set /P FRAME_END="����͏I���t���[��No: "

rem ---  ���]�w�胊�X�g
echo --------------
set REVERSE_SPECIFIC_LIST=
echo Openpose����F�����Ĕ��]���Ă���t���[���ԍ�(0�n�܂�)�A�l��INDEX���ԁA���]�̓��e���w�肵�Ă��������B
echo Openpose��0F�ڂŔF���������Ԃ�0, 1, ��INDEX�����蓖�Ă��܂��B
echo �t�H�[�}�b�g�F�m���t���[���ԍ���:���]���w�肵�����l��INDEX,<���]���e>�n
echo <���]���e>: R: �S�g���], U: �㔼�g���], L: �����g���], N: ���]�Ȃ�
echo ��j[10:1,R]�@�c�@10F�ڂ�1�Ԗڂ̐l����S�g���]���܂��B
echo message.log�ɏ�L�t�H�[�}�b�g�ŁA���]�o�͂����ꍇ�ɂ��̓��e���o�͂��Ă���̂ŁA������Q�l�ɂ��Ă��������B
echo [10:1,R][30:0,U]�̂悤�ɁA�J�b�R�P�ʂŕ������w��\�ł��B
set /P REVERSE_SPECIFIC_LIST="�����]�w�胊�X�g: "

rem ---  ���Ԏw�胊�X�g
echo --------------
set ORDER_SPECIFIC_LIST=
echo �����l���g���[�X�ŁA������̐l��INDEX���Ԃ��w�肵�Ă��������B1�l�g���[�X�̏ꍇ�͋󗓂̂܂܂ő��v�ł��B
echo Openpose��0F�ڂŔF���������Ԃ�0, 1, ��INDEX�����蓖�Ă��܂��B
echo �t�H�[�}�b�g�F�m���t���[���ԍ���:0�Ԗڂɐ��肳�ꂽ�l���̃C���f�b�N�X,1�Ԗڂɐ��肳�ꂽ�l���̃C���f�b�N�X, �c�n
echo ��j[10:1,0]�@�c�@10F�ڂ́A������1�Ԗڂ̐l���A0�Ԗڂ̐l���̏��Ԃɕ��בւ��܂��B
echo message.log�ɏ�L�t�H�[�}�b�g�ŁA�ǂ̂悤�ȏ��Ԃŏo�͂��������c���Ă���̂ŁA������Q�l�ɂ��Ă��������B
echo [10:1,0][30:0,1]�̂悤�ɁA�J�b�R�P�ʂŕ������w��\�ł��B
echo �܂��Aoutput_XXX.avi�ł́A���肳�ꂽ���Ԃɐl���ɐF�����蓖�Ă��Ă��܂��B�̂̉E�����͐ԁA�������͈ȉ��̐F�ɂȂ�܂��B
echo 0:��, 1:��, 2:��, 3:��, 4:��, 5:���F, 6:�Z��, 7:�Z��, 8:�D�F, 9:�Z��, 10:�Z��, 11:�Z���F
set /P ORDER_SPECIFIC_LIST="�����Ԏw�胊�X�g: "

rem ---  MMD�pAVI�o��
echo --------------
echo MMD�pAVI���o�����Ayes �� no ����͂��ĉ������B
echo MMD�pAVI�́AOpenpose�̌��ʂɁA�l��INDEX�ʏ����悹�āA�T�C�Y�����߂ŏo�͂��܂��B
echo �������͂����AENTER�����������ꍇ�AMMD�pAVI���o�͂��܂��B
set AVI_OUTPUT=yes
set /P AVI_OUTPUT="��MMD�pAVI[yes/no]: "

rem ---  �ڍ׃��O�L��
echo --------------
echo �ڍׂȃ��O���o�����Ayes �� no ����͂��ĉ������B
echo �������͂����AENTER�����������ꍇ�A�ʏ탍�O�Ɛ[�x����GIF���o�͂��܂��B
echo warn �Ǝw�肷��ƁA�A�j���[�V����GIF���o�͂��܂���B�i���̕������ł��j
set VERBOSE=2
set IS_DEBUG=no
set /P IS_DEBUG="���ڍ׃��O[yes/no/warn]: "

IF /I "%IS_DEBUG%" EQU "yes" (
    set VERBOSE=3
)

IF /I "%IS_DEBUG%" EQU "warn" (
    set VERBOSE=1
)

rem ---  python ���s
python tensorflow/predict_video.py --model_path tensorflow/data/NYU_FCRN.ckpt --centerz_model_path tensorflow/data2/centerz-depth.ckpt --past_depth_path "%PAST_DEPTH_PATH%" --video_path %INPUT_VIDEO% --json_path %OPENPOSE_JSON% --interval %DEPTH_INTERVAL% --reverse_specific "%REVERSE_SPECIFIC_LIST%" --order_specific "%ORDER_SPECIFIC_LIST%" --avi_output %AVI_OUTPUT% --verbose %VERBOSE% --number_people_max %NUMBER_PEOPLE_MAX% --end_frame_no %FRAME_END%



