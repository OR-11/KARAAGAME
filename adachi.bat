rem https://www.tohoho-web.com/ex/bat.html
rem https://twitter.com/Tasty_Liquid_N/status/1758102503340863709
rem 足立
rem ᶱjㆆヮㆆjᶪ⎤ 
rem サイズ：全角7個分
rem 唐揚げ
rem 🔶
rem サイズ：全角1個分

@echo off
setlocal
chcp 65001

echo    _  __          _____                      
echo   ^| ^|/ /    /\   ^|  __ \     /\        /\    
echo   ^| ' /    /  \  ^| ^|__^) ^|   /  \      /  \   
echo   ^|  ^<    / /\ \ ^|  _  /   / /\ \    / /\ \  
echo   ^| . \  / ____ \^| ^| \ \  / ____ \  / ____ \ 
echo   ^|_^|\_\/_/___ \_\_^|  \_\/_/__ _\_\/_/    \_\
echo         / ____^|   /\   ^|  \/  ^|  ____^|       
echo        ^| ^|  __   /  \  ^| \  / ^| ^|__          
echo        ^| ^| ^|_ ^| / /\ \ ^| ^|\/^| ^|  __^|         
echo        ^| ^|__^| ^|/ ____ \^| ^|  ^| ^| ^|____        
echo         \_____/_/    \_\_^|  ^|_^|______^|       
echo:                                              
echo:                                            
echo 足立レイの顔文字^(ᶱjㆆヮㆆjᶪ⎤^)は、 えきちのみ 様の投稿していたものを使わせていただきました。
echo ^(https://twitter.com/Tasty_Liquid_N/status/1758102503340863709^)
echo.
echo Press any key to start...  
pause > NUL

goto GamePre

:GamePre
set width=46
set height=23
goto setting

:setting
cls
setlocal enabledelayedexpansion
SET /P X=＋<NUL
for /L %%n in (1, 1, !width!) do (
    SET /P X=ー<NUL
)
SET /P X=＋<NUL
echo.
endlocal
setlocal enabledelayedexpansion
for /L %%m in (1, 1, !height!) do (
    setlocal enabledelayedexpansion
    SET /P X=｜<NUL
    for /L %%n in (1, 1, !width!) do (
        SET /P X="・"<NUL
    )
    SET /P X=｜<NUL
    echo.
    endlocal
)
endlocal
setlocal enabledelayedexpansion
SET /P X=＋<NUL
for /L %%n in (1, 1, !width!) do (
    SET /P X=ー<NUL
)
SET /P X=＋<NUL
echo.
endlocal
echo width:%width%　height:%height%
echo フィールドはこんな感じの広さです。このまま遊ぶか、サイズを変える、どちらにしますか？
choice /c pc /m "Play[p] or Change[c]"

if "%ERRORLEVEL%"=="1" (
    goto Ready
)
echo どちらの値を変更しますか？
choice /c wh /m "width[w] or height[h]"
if "%ERRORLEVEL%"=="1" (
    goto changeW
) else (
    goto changeH
)

:changeW
choice /c 1234567890 /m 十の位：0~9
if %ERRORLEVEL%==10 (
    set /a TW = 0
) else (
    set /a TW = %ERRORLEVEL% * 10
)
echo width = %ERRORLEVEL%_
choice /c 1234567890 /m 一の位：0~9
if %ERRORLEVEL%==10 (
    set /a width = %TW%
) else (
    set /a width = %TW% + %ERRORLEVEL%
)
echo width = %width%

goto setting


:changeH
choice /c 1234567890 /m 十の位：0~9
if %ERRORLEVEL%==10 (
    set /a TH = 0
) else (
    set /a TH = %ERRORLEVEL% * 10
)
echo height = %ERRORLEVEL%_
choice /c 1234567890 /m 一の位：0~9
if %ERRORLEVEL%==10 (
    set /a height = %TH%
) else (
    set /a height = %TH% + %ERRORLEVEL%
)
echo height = %height%

goto setting



:Ready
cls
echo 唐揚げ→🔶　足立レイ→ᶱjㆆヮㆆjᶪ⎤
echo WASDで移動。
echo.
echo Press any key to start the game.
pause > NUL

setlocal
rem フィールド展開用
set top=＋

set middle=｜

set below=＋

set edge=
set center=

setlocal enabledelayedexpansion
for /L %%n in (1, 1, %width%) do (
    set edge=!edge!ー
    set center=!center!・
)
rem endlocal

set top=%top%%edge%＋

set middle=%middle%%center%｜

set below=%below%%edge%＋


rem 唐揚げ座標※-1の時はゲット済み
set KaX=-1
set KaY=-1

rem 足立座標
set AdX=0
set /a AdXe = %AdX% + 5
set AdY=0

rem 唐揚げ(と足立)の関係

rem 0唐揚げと足立が同じ高さ　1唐揚げと足立は違う高さ
set KaSt=1

rem 唐揚げ行
set KaLi=

rem 足立行
set AdLi=

rem 唐揚げ個数
set KaN=0

rem time(min)time(s),time(ms)
rem set TiMi=%Time:~-8,2%
rem set t=%Time:~-5,2%

FOR /F %%i in ('powershell -command "Get-Date (Get-Date -Format U) -UFormat %%s"') do (
    set t=%%i
)

set mt=%Time:~-2,2%

rem 時間(s)------------------------------------------------------------------------------------------------------------------------------
set Ti=60

rem LeftTime
set LeTi=%Ti%

rem 終了時刻設定
set /a EndTi = %t% + %Ti%

rem 秒換算(現在、ms)
FOR /F %%i in ('powershell -command "Get-Date (Get-Date -Format U) -UFormat %%s"') do set CuTiS=%%i
set Cumt=%Time:~-2,2%

goto Game


rem ゲーム
setlocal enabledelayedexpansion
:Game
rem cls

rem 秒換算(現在、ms)
FOR /F %%i in ('powershell -command "Get-Date (Get-Date -Format U) -UFormat %%s"') do set CuTiS=%%i
set Cumt=!Time:~-2,2!

rem 残り時間計算
set /a LeTi = !EndTi! - !CuTiS!

rem 唐揚げランダム用
set Ra=!RANDOM!
set /a KaRaX = (!Ra! - (!Ra! / 100 * 100))
if !KaRaX!==0 (
    rem 何にもしない
) else set /a KaRaX = (!width! - 1) / (100 / !KaRaX!)

set Ra=!RANDOM!
set /a KaRaY = (!Ra! - (!Ra! / 100 * 100))
if !KaRaY!==0 (
    rem なにもしない
) else set /a KaRaY = (!height! - 1) / (100 / !KaRaY!)

rem 座標計算
set /a AdXe = !AdX! + 6
if !KaY!==!AdY! (
    rem 唐揚げX≧足立X
    if !KaX! geq !AdX! (
        rem 唐揚げX≦足立XEnd
        if !KaX! lss !AdXe! (
            rem 唐揚げゲット
            set /a KaN = !KaN! + 1
            set KaX=-1
            set KaY=-1
        )
    )
)

if !KaX!==-1 (
    set KaX=!KaRaX!
    set KaY=!KaRaY!
)

rem 足立枠外脱走防止
rem 上
if !AdY! lss 0 (
    set AdY=0
)
rem 下
if !AdY! gtr !height! (
    set AdY=!height!
)
rem 左
if !AdX! lss 0 (
    set AdX=0
)
rem 右
if !AdXe! geq !width! (
    set /a AdX = !AdX! - !AdXe! + !width!
)

rem 唐揚げ&足立行の準備
if !KaY!==!AdY! (
    rem 唐揚げと足立がおんなじ高さ
    set KaSt=0
    set AdLi=｜

    set c=0
    rem c-1
    set cMo=-1
    setlocal enabledelayedexpansion
    for /L %%n in (0, 1, !width!) do (
        if !c!==!AdX! (
            set AdLi=!AdLi!ᶱjㆆヮㆆjᶪ⎤ 
            set /a c = !c! + 5
        ) else if !c!==!KaX! (
            set AdLi=!AdLi!🔶
        ) else if !c! lss !width! (
            set AdLi=!AdLi!・
        )
        set /a c = !c! + 1
        set /a cMo = !c! - 1
    )
    set AdLi=!AdLi!｜

) else (
    rem そうじゃないとき
    set KaSt=1
    set KaLi=｜
    set AdLi=｜

    set AdN=0
    set c=0
    setlocal enabledelayedexpansion
    for /L %%n in (0, 1, !width!) do (
        if !c!==!KaX! (
            set KaLi=!KaLi!🔶
        ) else if !c! lss !width! (
            set KaLi=!KaLi!・
        )

        if !AdN! leq !width! (
            if !AdN!==!AdX! (
                set AdLi=!AdLi!ᶱjㆆヮㆆjᶪ⎤ 
                set /a AdN =!AdN! + 6
            ) else (
                set AdLi=!AdLi!・
            )
        )
        set /a AdN = !AdN! + 1
        set /a c = !c! + 1
    )
    set KaLi=!KaLi!｜
    set AdLi=!AdLi!｜

)

cls
echo !KaX!,!KaY!
echo !top!
rem echo %middle%
setlocal enabledelayedexpansion
for /L %%n in (0, 1, !height!) do (
    if %%n==!AdY! (
        if %%n==!KaY! (
            rem 唐揚げと足立が存在する行
            echo !AdLi!
        ) else (
            rem 足立だけが存在する行
            echo !AdLi!
        )
    ) else if %%n==!KaY! (
        rem 唐揚げだけが存在する行
        echo !KaLi!
    ) else (
        rem ごく一般的な行
        echo !middle!
    )
)
endlocal
endlocal
echo !below!
echo 唐揚げの数:!KaN! 残り時間:!LeTi!

rem 操作
choice /c wasdn /n /t 1 /d n
if !ERRORLEVEL!==1 (
    set /a AdY = !AdY! - 1
) else if !ERRORLEVEL!==3 (
    set /a AdY = !AdY! + 1
) else if !ERRORLEVEL!==2 (
    set /a AdX = !AdX! - 1
) else if !ERRORLEVEL!==4 (
    set /a AdX = !AdX! + 1
)

if !CuTiS!.!Cumt! gtr !EndTi!.!mt! (
    goto Result
)

goto Game
endlocal
endlocal
endlocal


:Result
echo.
echo Time Up
echo.
echo.
echo.
echo Result:
echo Width:%width%, Height:%height%
echo 唐揚げ:%KaN%個
echo.

:Share
choice /c yn /m Twitterに共有しますか?
if %ERRORLEVEL%==1 (
    goto Tweet
) else (
    goto end
)

:Tweet
echo 以下のURLをCtrlキーを押しながらクリックしてください。ブラウザが起動し投稿編集画面が表示されます。
echo https://twitter.com/intent/tweet?text=Height%%3D%height%%%E3%%80%%81Width%%3D%width%%%E3%%81%%A7%%E3%%80%%81%%E5%%94%%90%%E6%%8F%%9A%%E3%%81%%92%%E3%%82%%92%KaN%%%E5%%80%%8B%%E3%%82%%B2%%E3%%83%%83%%E3%%83%%88%%E3%%81%%97%%E3%%81%%BE%%E3%%81%%97%%E3%%81%%9F%%EF%%BC%%81%%0D%%0A^&hashtags=KARAAGAME
goto Share

:end
echo 何かのキーを押して終了します...
pause > NUL