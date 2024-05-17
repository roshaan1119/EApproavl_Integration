<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EApproval.Login" %>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="robots" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
    <meta property="og:title" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
    <meta property="og:description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
    <meta property="og:image" content="https://w3crm.dexignzone.com/xhtml/social-image.png">
    <meta name="format-detection" content="telephone=no">

    <!-- PAGE TITLE HERE -->
    <title>E-Approval Daewoo</title>
    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="image/png" href="images/TtitleImg.png" />

    <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="vh-100">
    <div style="width: 100%; height: 100%; position: relative; background: #F6FAFF">
    <div style="width: 176px; height: 176px; left: 90px; top: 781px; position: absolute; background: #005880; border-radius: 9999px"></div>
    <div style="width: 176px; height: 176px; left: 1187px; top: 62px; position: absolute; background: #005880; border-radius: 9999px"></div>
    <div style="width: 1144px; height: 781px; left: 148px; top: 121px; position: absolute; background: white; box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.17); border-radius: 24px"></div>
    <div style="width: 570px; height: 781px; left: 148px; top: 121px; position: absolute; background: #0095DA; border-top-left-radius: 24px; border-top-right-radius: 24px"></div>
    <div style="width: 164.61px; height: 114px; left: 351px; top: 181px; position: absolute">
        <div style="width: 164.61px; height: 114px; left: 0px; top: 0px; position: absolute">
            <div style="width: 164.61px; height: 18.86px; left: 0px; top: 95.14px; position: absolute; background: white"></div>
            <div style="width: 164.61px; height: 24.81px; left: 0px; top: 64.75px; position: absolute; background: white"></div>
            <div style="width: 74.89px; height: 55.76px; left: 44.98px; top: 0px; position: absolute; background: white"></div>
        </div>
    </div>
    <div style="width: 437px; height: 517px; left: 789px; top: 218px; position: absolute">
        
        <div style="left: 29px; top: 119px; position: absolute; text-align: center; color: #7F7F7E; font-size: 16px; font-family: Poppins; font-weight: 400; line-height: 20px; word-wrap: break-word">Continue your E-Approval journey with Daewoo</div>
        <div style="left: 139px; top: 0px; position: absolute; text-align: center; color: black; font-size: 32px; font-family: Roboto; font-weight: 800; line-height: 20px; word-wrap: break-word">E Approval</div>
        <div style="left: 181px; top: 78px; position: absolute; text-align: center; color: black; font-size: 20px; font-family: Poppins; font-weight: 500; line-height: 20px; word-wrap: break-word">Sign In</div>
        <form>
            <div style="width: 437px; height: 56px; left: 0px; top: 202px; position: absolute; border: 1px #333333 solid">
                <input type="text" id="txtEmail" placeholder="abc@gmail.com" style="width: 100%; height: 100%; border: none; outline: none; padding: 10px; font-size: 16px;">
            </div>
            <div style="width: 437px; height: 56px; left: 0px; top: 290px; position: absolute; border: 1px #333333 solid">
                <input type="password" id="dz-password" placeholder="Password..." style="width: 100%; height: 100%; border: none; outline: none; padding: 10px; font-size: 16px;">
            </div>
            <div style="width: 437px; height: 56px; left: 0px; top: 378px; position: absolute; border: 1px #333333 solid">                
                <select id="ddlProjects" style="width: 100%; height: 100%; border: none; outline: none; padding: 10px; font-size: 16px;">
                    <%--<option value="" disabled selected>Select Project</option>--%>
                </select>
            </div>
            <div style="width: 437px; height: 56px; left: 0px; top: 466px; position: absolute; background: #0095DA; border-radius: 4px">
                <button type="button" onclick="Login();" style="width: 100%; height: 100%; border: none; outline: none; background: none; color: white; font-size: 18px; font-family: Poppins; font-weight: 500; cursor: pointer;">Sign In</button>
            </div>
            
        </form>

    </div>
    <div style="width: 334px; height: 348.50px; left: 266px; top: 495px; position: absolute; flex-direction: column; justify-content: center; align-items: center; display: inline-flex">
        <div style="width: 334px; height: 348.50px; position: relative">
            <div style="width: 188.54px; height: 86.70px; left: 131.71px; top: 171.45px; position: absolute; background: #A5BCE3"></div>
            <div style="width: 162.55px; height: 91.83px; left: 17.06px; top: 199.16px; position: absolute; background: #031D47"></div>
            <div style="width: 50.94px; height: 29.41px; left: 166.92px; top: 283.43px; position: absolute; background: #031D47"></div>
            <div style="width: 50.93px; height: 29.41px; left: 82.96px; top: 319.10px; position: absolute; background: #031D47"></div>
            <div style="width: 50.94px; height: 29.41px; left: 222.74px; top: 317.49px; position: absolute; background: #031D47"></div>
            <div style="width: 50.94px; height: 29.41px; left: 15.72px; top: 280.27px; position: absolute; background: #031D47"></div>
            <div style="width: 50.93px; height: 29.41px; left: 283.07px; top: 284.66px; position: absolute; background: #031D47"></div>
            <div style="width: 50.94px; height: 29.41px; left: 222.74px; top: 249.35px; position: absolute; background: #031D47"></div>
            <div style="width: 328.65px; height: 344.41px; left: 0px; top: 0px; position: absolute">
                <div style="width: 154.38px; height: 95.58px; left: 21.55px; top: 191px; position: absolute">
                    <div style="width: 154.38px; height: 94.11px; left: -0px; top: 1.48px; position: absolute">
                        <div style="width: 18.35px; height: 2.49px; left: 44.45px; top: -0px; position: absolute; background: #332A43"></div>
                        <div style="width: 42.77px; height: 23.75px; left: 3.93px; top: 2.30px; position: absolute; background: #2D243E"></div>
                        <div style="width: 3.71px; height: 9.97px; left: -0px; top: 31.28px; position: absolute; background: #211833"></div>
                        <div style="width: 6.17px; height: 10.63px; left: 0.01px; top: 25.84px; position: absolute; background: #2D243E"></div>
                        <div style="width: 90.11px; height: 50.95px; left: 60.57px; top: 2.13px; position: absolute; background: #2D243E"></div>
                        <div style="width: 6.17px; height: 10.63px; left: 148.21px; top: 52.87px; position: absolute; background: #2D243E"></div>
                        <div style="width: 3.94px; height: 10.21px; left: 150.43px; top: 58.06px; position: absolute; background: #211833"></div>
                        <div style="width: 42.76px; height: 25.94px; left: 107.69px; top: 61.10px; position: absolute; background: #2D243E"></div>
                        <div style="width: 40.53px; height: 28.32px; left: 109.93px; top: 63.50px; position: absolute; background: #211833"></div>
                        <div style="width: 90.12px; height: 53.14px; left: 3.70px; top: 34.07px; position: absolute; background: #2D243E"></div>
                        <div style="width: 87.90px; height: 55.52px; left: 3.68px; top: 36.47px; position: absolute; background: #211833"></div>
                        <div style="width: 148.01px; height: 85.65px; left: 3.20px; top: 0.75px; position: absolute; background: #332A43"></div>
                        <div style="width: 18.36px; height: 4.68px; left: 91.58px; top: 84.64px; position: absolute; background: #2D243E"></div>
                        <div style="width: 18.37px; height: 7.06px; left: 91.56px; top: 87.04px; position: absolute; background: #211833"></div>
                    </div>
                    <div style="width: 145.95px; height: 85.85px; left: 4.21px; top: 0px; position: absolute">
                        <div style="width: 3.77px; height: 0.72px; left: 32.65px; top: 8.37px; position: absolute; background: #3385FF"></div>
                        <div style="width: 0.67px; height: 2.77px; left: 33.42px; top: 7.71px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 1.54px; height: 2.50px; left: 11.69px; top: 20.38px; position: absolute; background: #3385FF"></div>
                        <div style="width: 139.97px; height: 80.99px; left: 2.99px; top: 1.42px; position: absolute; background: linear-gradient(90deg, #3385FF 0%, #7BAEFA 100%)"></div>
                        <div style="width: 0.77px; height: 2.11px; left: 32.65px; top: 6.98px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 3.60px; height: 6.42px; left: -0px; top: 28.85px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 3.55px; height: 6.35px; left: 142.40px; top: 55.61px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 37.53px; height: 23.20px; left: 104.87px; top: 60.58px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 84px; height: 49.89px; left: 3.61px; top: 33.88px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 145.94px; height: 84.45px; left: 0.01px; top: -0px; position: absolute; background: linear-gradient(30deg, #1F79FF 45%, #7BAEFA 100%)"></div>
                        <div style="width: 17.26px; height: 3.46px; left: 87.61px; top: 82.39px; position: absolute; background: #2A68C6"></div>
                    </div>
                    <div style="width: 31.71px; height: 17.42px; left: 101.83px; top: 49.54px; position: absolute; background: white"></div>
                    <div style="width: 118.97px; height: 55.38px; left: 31.18px; top: 14.64px; position: absolute">
                        <div style="width: 28.39px; height: 16.39px; left: 0px; top: 0px; position: absolute; background: white"></div>
                        <div style="width: 38.58px; height: 22.27px; left: 5.03px; top: 2.91px; position: absolute; background: white"></div>
                        <div style="width: 38.58px; height: 22.27px; left: 12.03px; top: 6.95px; position: absolute; background: white"></div>
                        <div style="width: 38.58px; height: 22.27px; left: 19.04px; top: 10.99px; position: absolute; background: white"></div>
                        <div style="width: 31.28px; height: 18.06px; left: 26.06px; top: 19.25px; position: absolute; background: white"></div>
                        <div style="width: 38.58px; height: 22.27px; left: 33.07px; top: 19.10px; position: absolute; background: white"></div>
                        <div style="width: 28.99px; height: 16.73px; left: 78.88px; top: 38.65px; position: absolute; background: white"></div>
                        <div style="width: 16.30px; height: 9.06px; left: 102.67px; top: 35.89px; position: absolute; background: #91B8F2"></div>
                        <div style="width: 14.33px; height: 8.27px; left: 40.08px; top: 37.14px; position: absolute; background: white"></div>
                    </div>
                </div>
                <div style="width: 152.77px; height: 228.97px; left: 172.49px; top: 0px; position: absolute">
                    <div style="width: 71.46px; height: 98.32px; left: 40.21px; top: 130.65px; position: absolute">
                        <div style="width: 37.46px; height: 20.82px; left: 32.99px; top: 51.44px; position: absolute; background: #888B90"></div>
                        <div style="width: 35.08px; height: 20.58px; left: 32.09px; top: 52.33px; position: absolute; background: #083E8E"></div>
                        <div style="width: 6.92px; height: 8.90px; left: 64.55px; top: 71.78px; position: absolute; background: #888B90"></div>
                        <div style="width: 56.01px; height: 71.27px; left: 11.17px; top: 1.40px; position: absolute; background: #ADADB4"></div>
                        <div style="width: 38.45px; height: 28.53px; left: 29.55px; top: 51.92px; position: absolute; background: #BABCBF"></div>
                        <div style="width: 65.35px; height: 37.92px; left: 0px; top: 60.40px; position: absolute; background: #888B90"></div>
                        <div style="width: 64.57px; height: 37.91px; left: 0px; top: 58.35px; position: absolute; background: linear-gradient(30deg, #E8E8E9 13%, #D1D1D4 58%, #C9C9CD 100%)"></div>
                        <div style="width: 22.63px; height: 52.58px; left: 46.18px; top: 20.34px; position: absolute; background: #888B90"></div>
                        <div style="width: 36.39px; height: 21.74px; left: 11.17px; top: 0px; position: absolute; background: #083E8E"></div>
                    </div>
                    <div style="width: 152.61px; height: 206.78px; left: 0.16px; top: 0px; position: absolute">
                        <div style="width: 128.69px; height: 74.27px; left: 14.84px; top: 1.39px; position: absolute; background: #083E8E"></div>
                        <div style="width: 1.23px; height: 0.69px; left: 14.61px; top: 1.26px; position: absolute; background: #083E8E"></div>
                        <div style="width: 7.34px; height: 9.04px; left: 144.96px; top: 197.07px; position: absolute; background: #818489"></div>
                        <div style="width: 0.31px; height: 105.68px; left: 152.29px; top: 91.39px; position: absolute; background: #083E8E"></div>
                        <div style="width: 4.70px; height: 107.07px; left: 147.90px; top: 92.55px; position: absolute; background: linear-gradient(30deg, #818489 16%, #B7B9BD 100%)"></div>
                        <div style="width: 10.09px; height: 17.44px; left: 142.53px; top: 75.11px; position: absolute; background: #818489"></div>
                        <div style="width: 146.20px; height: 201.67px; left: 0px; top: 4.42px; position: absolute; background: linear-gradient(60deg, #BBBDBF 6%, #C7C9CB 74%)"></div>
                        <div style="width: 147.90px; height: 204.22px; left: 0.29px; top: 2.56px; position: absolute; background: linear-gradient(60deg, #989A9F 21%, #B7B9BD 100%)"></div>
                        <div style="width: 149.33px; height: 95.11px; left: 3.25px; top: 0px; position: absolute; background: linear-gradient(60deg, #818489 0%, #B7B9BD 43%)"></div>
                    </div>
                    <div style="width: 144.50px; height: 184.78px; left: -0px; top: 7.08px; position: absolute">
                        <div style="width: 10.07px; height: 17.44px; left: -0px; top: 95.11px; position: absolute; background: #083E8E"></div>
                        <div style="width: 0.85px; height: 87.86px; left: -0px; top: 7.95px; position: absolute; background: #083E8E"></div>
                        <div style="width: 8.54px; height: 2.17px; left: 3.20px; top: -0px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 10.13px; height: 7.86px; left: 0.25px; top: 0.79px; position: absolute; background: #083E8E"></div>
                        <div style="width: 123.01px; height: 71.71px; left: 9.77px; top: 111.68px; position: absolute; background: #083E8E"></div>
                        <div style="width: 4.30px; height: 7.26px; left: 139.97px; top: 176.83px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 10.43px; height: 7.51px; left: 132.47px; top: 177.27px; position: absolute; background: #083E8E"></div>
                        <div style="width: 1.60px; height: 87.94px; left: 142.91px; top: 89.67px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 1.46px; height: 87.51px; left: 141.70px; top: 90.11px; position: absolute; background: #083E8E"></div>
                        <div style="width: 123.02px; height: 72.06px; left: 10.07px; top: 2.16px; position: absolute; background: #083E8E"></div>
                        <div style="width: 124.05px; height: 71.62px; left: 10.38px; top: 1.39px; position: absolute; background: #2A68C6"></div>
                        <div style="width: 141.34px; height: 181.65px; left: 0.60px; top: 2.12px; position: absolute; background: linear-gradient(60deg, #0066FF 28%, #7BAEFA 100%)"></div>
                        <div style="width: 106.03px; height: 162.93px; left: 16.41px; top: 13.68px; position: absolute; background: #083E8E"></div>
                        <div style="width: 10.38px; height: 17.44px; left: 132.78px; top: 73.01px; position: absolute; background: #083E8E"></div>
                        <div style="width: 11.42px; height: 18.22px; left: 133.09px; top: 72.22px; position: absolute; background: #2A68C6"></div>
                    </div>
                    <div style="width: 0.55px; height: 1.73px; left: 34.31px; top: 125.28px; position: absolute; background: #52586C"></div>
                    <div style="width: 107.34px; height: 153.91px; left: 11.90px; top: 22.51px; position: absolute">
                        <div style="width: 105.85px; height: 153.05px; left: 0px; top: 0.86px; position: absolute; background: linear-gradient(30deg, #EAECEF 0%, #F2F2F2 67%)"></div>
                        <div style="width: 107px; height: 62.17px; left: 0px; top: 0px; position: absolute; background: #E4E7ED"></div>
                        <div style="width: 1.83px; height: 92.60px; left: 105.51px; top: 61.32px; position: absolute; background: #E4E7ED"></div>
                    </div>
                    <div style="width: 14.85px; height: 8.60px; left: 65.17px; top: 203.61px; position: absolute; background: #0E4AB6"></div>
                    <div style="width: 14.86px; height: 6.34px; left: 65.16px; top: 203.61px; position: absolute; background: #888B90"></div>
                </div>
                <div style="width: 40.24px; height: 40.40px; left: 172.26px; top: 268.33px; position: absolute">
                    <div style="width: 40.24px; height: 31.20px; left: -0px; top: 9.21px; position: absolute">
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.24px; left: 0px; top: 0px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 40.24px; height: 31.20px; left: 0px; top: 0px; position: absolute">
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                    </div>
                    <div style="width: 16.50px; height: 9.53px; left: 11.87px; top: 6.85px; position: absolute; background: #EBF2F9"></div>
                </div>
                <div style="width: 145.73px; height: 177.28px; left: 128.80px; top: 67.87px; position: absolute">
                    <div style="width: 32.08px; height: 105.01px; left: 23.48px; top: 72.26px; position: absolute">
                        <div style="width: 6.98px; height: 8.31px; left: 2.70px; top: 96.70px; position: absolute; background: #3D4359"></div>
                        <div style="width: 8.89px; height: 10.52px; left: 0.05px; top: 94.49px; position: absolute; background: #464D62"></div>
                        <div style="width: 7.24px; height: 16.27px; left: 8.94px; top: 80.99px; position: absolute; background: #464C61"></div>
                        <div style="width: 1.93px; height: 4.51px; left: 14.39px; top: 77.98px; position: absolute; background: #626779"></div>
                        <div style="width: 14.67px; height: 20.24px; left: -0px; top: 77.51px; position: absolute; background: linear-gradient(97deg, #4E5468 0%, #4E5468 11%, #797E8D 27%, #707585 35%, #585E71 48%, #4E5468 53%)"></div>
                        <div style="width: 13.61px; height: 8.23px; left: 1.05px; top: 74.97px; position: absolute; background: #626779"></div>
                        <div style="width: 1.60px; height: 3.32px; left: 29.28px; top: 11.98px; position: absolute; background: #90A09E"></div>
                        <div style="width: 12.22px; height: 6.86px; left: 17.18px; top: 9.08px; position: absolute; background: #90A09E"></div>
                        <div style="width: 28.65px; height: 70.69px; left: 2.18px; top: 10.57px; position: absolute; background: linear-gradient(103deg, #BCC6C4 2%, #DCE1E0 23%, #DDE2E1 35%, #D5DBDA 40%, #9EACAA 79%, #889A97 98%)"></div>
                        <div style="width: 2.88px; height: 6.34px; left: 29.20px; top: 1.96px; position: absolute; background: linear-gradient(60deg, #DCE1E0 31%, #B3BFBC 98%)"></div>
                        <div style="width: 11.55px; height: 8.46px; left: 19.12px; top: 0.47px; position: absolute; background: linear-gradient(60deg, #BEC8C6 2%, #DCE1E0 69%)"></div>
                        <div style="width: 7.32px; height: 4.10px; left: 22.69px; top: -0px; position: absolute; background: linear-gradient(30deg, #BEC8C6 2%, #D6DCDB 90%)"></div>
                        <div style="width: 14.30px; height: 11.15px; left: 17.73px; top: 3.81px; position: absolute; background: linear-gradient(103deg, #BCC6C4 2%, #DCE1E0 23%, #DDE2E1 35%, #D5DBDA 40%, #9EACAA 79%, #889A97 98%)"></div>
                    </div>
                    <div style="width: 145.73px; height: 158.24px; left: 0px; top: 0px; position: absolute">
                        <div style="width: 73.33px; height: 84.41px; left: 72.40px; top: 0px; position: absolute">
                            <div style="width: 62px; height: 79.66px; left: 5.67px; top: 2.37px; position: absolute; background: #8FBCFF"></div>
                            <div style="width: 42.20px; height: 73.11px; left: -0px; top: 21.30px; position: absolute; transform: rotate(-30.31deg); transform-origin: 0 0; background: #62A1FF"></div>
                            <div style="width: 41.88px; height: 53.80px; left: 14.89px; top: 15.79px; position: absolute; background: #7FB3FF"></div>
                        </div>
                        <div style="width: 123.13px; height: 136px; left: -0px; top: 22.24px; position: absolute">
                            <div style="width: 52.99px; height: 57.48px; left: 70.14px; top: 0px; position: absolute; background: linear-gradient(330deg, #31374E 21%, #4B5264 59%, #454B60 94%)"></div>
                            <div style="width: 28.82px; height: 49.92px; left: 57.62px; top: 21.61px; position: absolute; transform: rotate(-30.31deg); transform-origin: 0 0; background: #3B4157"></div>
                            <div style="width: 32.48px; height: 41.73px; left: 66.41px; top: 15.03px; position: absolute; background: #F0F4EF"></div>
                            <div style="width: 28.55px; height: 41.12px; left: 68.57px; top: 16.09px; position: absolute; background: #F0F4EF"></div>
                            <div style="width: 32.48px; height: 41.73px; left: 63.81px; top: 16.53px; position: absolute; background: #F0F4EF"></div>
                            <div style="width: 91.54px; height: 115.17px; left: -0px; top: 20.83px; position: absolute">
                                <div style="width: 91.54px; height: 104.49px; left: 0px; top: 0px; position: absolute; background: linear-gradient(330deg, #FF7D50 0%, #FF9874 37%, #FFBBA3 82%)"></div>
                                <div style="width: 16.30px; height: 40.60px; left: 1.64px; top: 34.95px; position: absolute; background: #FCF4F0"></div>
                                <div style="width: 16.52px; height: 29.57px; left: 4.79px; top: 73.01px; position: absolute; background: #FCF4F0"></div>
                                <div style="width: 48.64px; height: 76.14px; left: 29.93px; top: 39.04px; position: absolute; background: linear-gradient(30deg, #FFA98A 18%, #FFA484 69%)"></div>
                                <div style="width: 25px; height: 71.64px; left: 29.91px; top: 38.25px; position: absolute; background: #F2C7B5"></div>
                                <div style="width: 4.96px; height: 31.37px; left: 1.64px; top: 34.66px; position: absolute; background: #F2C7B5"></div>
                                <div style="width: 54.30px; height: 87.35px; left: 37.23px; top: 25.33px; position: absolute; background: #FCF4F0"></div>
                                <div style="width: 10.48px; height: 12.67px; left: 33.74px; top: 101.89px; position: absolute; background: #FFB9A0"></div>
                                <div style="width: 47.76px; height: 89.39px; left: 5.39px; top: 21.85px; position: absolute; background: linear-gradient(330deg, #FF9C78 17%, #FFBBA3 82%)"></div>
                                <div style="width: 29.36px; height: 66.36px; left: 19.91px; top: 27.67px; position: absolute; background: #F2C7B5"></div>
                                <div style="width: 7.14px; height: 15.40px; left: 32px; top: 42.40px; position: absolute; background: #F2C7B5"></div>
                                <div style="width: 1.11px; height: 4.71px; left: 29.94px; top: 102.13px; position: absolute; background: #F2C7B5"></div>
                                <div style="width: 6.73px; height: 12.17px; left: 19.20px; top: 99.95px; position: absolute; background: #FFB9A0"></div>
                            </div>
                        </div>
                    </div>
                    <div style="width: 25.92px; height: 72.93px; left: 29.64px; top: 72.26px; position: absolute">
                        <div style="width: 1.60px; height: 3.32px; left: 23.11px; top: 11.98px; position: absolute; background: #90A09E"></div>
                        <div style="width: 12.22px; height: 6.86px; left: 11.02px; top: 9.08px; position: absolute; background: #90A09E"></div>
                        <div style="width: 24.68px; height: 62.36px; left: -0px; top: 10.57px; position: absolute; background: linear-gradient(103deg, #BCC6C4 2%, #DCE1E0 23%, #DDE2E1 35%, #D5DBDA 40%, #9EACAA 79%, #889A97 98%)"></div>
                        <div style="width: 12.95px; height: 8.45px; left: 12.96px; top: 0.47px; position: absolute; background: linear-gradient(140deg, #DCE1E0 0%, #BEC8C6 52%, #8C9D9A 100%)"></div>
                        <div style="width: 7.32px; height: 4.10px; left: 16.53px; top: -0px; position: absolute; background: #DCE1E0"></div>
                        <div style="width: 14.30px; height: 11.15px; left: 11.57px; top: 3.81px; position: absolute; background: linear-gradient(103deg, #BCC6C4 2%, #DCE1E0 23%, #DDE2E1 35%, #D5DBDA 40%, #9EACAA 79%, #889A97 98%)"></div>
                    </div>
                </div>
                <div style="width: 40.23px; height: 40.40px; left: 88.31px; top: 304px; position: absolute">
                    <div style="width: 40.23px; height: 31.19px; left: 0px; top: 9.21px; position: absolute">
                        <div style="width: 20.18px; height: 19.61px; left: 20.05px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.05px; height: 19.54px; left: 0px; top: 11.65px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.05px; height: 19.54px; left: 0px; top: 11.65px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.23px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 40.23px; height: 31.20px; left: 0px; top: 0px; position: absolute">
                        <div style="width: 20.18px; height: 19.61px; left: 20.05px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.05px; height: 19.54px; left: 0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.05px; height: 19.54px; left: 0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.23px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                    </div>
                    <div style="width: 16.51px; height: 9.53px; left: 11.86px; top: 6.85px; position: absolute; background: #EBF2F9"></div>
                </div>
                <div style="width: 45.86px; height: 64.86px; left: 263.33px; top: 43.77px; position: absolute">
                    <div style="width: 45.86px; height: 64.86px; left: 0px; top: 0px; position: absolute">
                        <div style="width: 45.84px; height: 62.99px; left: 0.02px; top: -0px; position: absolute; background: #A1BDFF"></div>
                        <div style="width: 25.54px; height: 16.25px; left: 20.32px; top: 10.21px; position: absolute; background: #B7CCFF"></div>
                        <div style="width: 25.54px; height: 13.22px; left: 0px; top: 0px; position: absolute; background: #A1BDFF"></div>
                        <div style="width: 40.63px; height: 61.85px; left: 0.01px; top: 3.01px; position: absolute; background: white"></div>
                        <div style="width: 33.27px; height: 50.25px; left: 3.70px; top: 9.89px; position: absolute; background: #A1BDFF"></div>
                        <div style="width: 31.97px; height: 48.64px; left: 4.98px; top: 10.75px; position: absolute; background: #00D158"></div>
                    </div>
                    <div style="width: 27.43px; height: 21.36px; left: 7.12px; top: 29.21px; position: absolute">
                        <div style="width: 2.38px; height: 1.41px; left: 13.47px; top: 19.65px; position: absolute; background: #C6C0D0"></div>
                        <div style="width: 7.21px; height: 4.24px; left: 1.08px; top: 0px; position: absolute; background: #D3E1FC"></div>
                        <div style="width: 6px; height: 7.50px; left: 6.18px; top: 3.02px; position: absolute; background: #D3E1FC"></div>
                        <div style="width: 12.84px; height: 9.96px; left: 13.74px; top: 10.91px; position: absolute; background: #D3E1FC"></div>
                        <div style="width: 4.75px; height: 1.73px; left: 19px; top: 1.81px; position: absolute; background: #D3E1FC"></div>
                        <div style="width: 5.80px; height: 9.82px; left: 21.63px; top: 2.32px; position: absolute; background: #D3E1FC"></div>
                        <div style="width: 25.32px; height: 20.12px; left: 0px; top: 1.24px; position: absolute; background: white"></div>
                    </div>
                </div>
                <div style="width: 21.69px; height: 102.91px; left: 85.48px; top: 68.99px; position: absolute">
                    <div style="width: 21.69px; height: 24.01px; left: 0px; top: 78.90px; position: absolute">
                        <div style="width: 1.90px; height: 1.13px; left: 4.73px; top: 22.64px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.77px; height: 3.40px; left: 15.06px; top: 0px; position: absolute; background: #3689F5"></div>
                        <div style="width: 9.09px; height: 12.93px; left: 7.66px; top: 2.41px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.73px; height: 4.27px; left: 0.68px; top: 19.35px; position: absolute; background: #3689F5"></div>
                        <div style="width: 3.80px; height: 1.39px; left: 2.95px; top: 12.06px; position: absolute; background: #3689F5"></div>
                        <div style="width: 4.64px; height: 7.87px; left: 0px; top: 12.47px; position: absolute; background: #3689F5"></div>
                        <div style="width: 20.01px; height: 23.03px; left: 1.68px; top: 0.98px; position: absolute; background: #001E31"></div>
                    </div>
                    <div style="width: 21.69px; height: 24.01px; left: 0px; top: 52.59px; position: absolute; opacity: 0.76">
                        <div style="width: 1.90px; height: 1.13px; left: 4.73px; top: 22.65px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.77px; height: 3.40px; left: 15.06px; top: -0px; position: absolute; background: #3689F5"></div>
                        <div style="width: 9.09px; height: 12.93px; left: 7.66px; top: 2.42px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.73px; height: 4.27px; left: 0.68px; top: 19.36px; position: absolute; background: #3689F5"></div>
                        <div style="width: 3.80px; height: 1.39px; left: 2.95px; top: 12.07px; position: absolute; background: #3689F5"></div>
                        <div style="width: 4.64px; height: 7.87px; left: 0px; top: 12.47px; position: absolute; background: #3689F5"></div>
                        <div style="width: 20.01px; height: 23.03px; left: 1.68px; top: 0.98px; position: absolute; background: #001E31"></div>
                    </div>
                    <div style="width: 21.69px; height: 24.01px; left: 0px; top: 26.30px; position: absolute; opacity: 0.52">
                        <div style="width: 1.90px; height: 1.13px; left: 4.73px; top: 22.65px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.77px; height: 3.40px; left: 15.06px; top: -0px; position: absolute; background: #3689F5"></div>
                        <div style="width: 9.09px; height: 12.92px; left: 7.66px; top: 2.42px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.73px; height: 4.28px; left: 0.68px; top: 19.35px; position: absolute; background: #3689F5"></div>
                        <div style="width: 3.80px; height: 1.39px; left: 2.95px; top: 12.07px; position: absolute; background: #3689F5"></div>
                        <div style="width: 4.64px; height: 7.87px; left: 0px; top: 12.47px; position: absolute; background: #3689F5"></div>
                        <div style="width: 20.01px; height: 23.03px; left: 1.68px; top: 0.98px; position: absolute; background: #001E31"></div>
                    </div>
                    <div style="width: 21.69px; height: 24.01px; left: 0px; top: 0px; position: absolute">
                        <div style="width: 1.90px; height: 1.13px; left: 4.73px; top: 22.64px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.77px; height: 3.40px; left: 15.06px; top: 0px; position: absolute; background: #3689F5"></div>
                        <div style="width: 9.09px; height: 12.92px; left: 7.66px; top: 2.42px; position: absolute; background: #3689F5"></div>
                        <div style="width: 5.73px; height: 4.28px; left: 0.68px; top: 19.35px; position: absolute; background: #3689F5"></div>
                        <div style="width: 3.80px; height: 1.39px; left: 2.95px; top: 12.06px; position: absolute; background: #3689F5"></div>
                        <div style="width: 4.64px; height: 7.87px; left: 0px; top: 12.47px; position: absolute; background: #3689F5"></div>
                        <div style="width: 20.01px; height: 23.03px; left: 1.68px; top: 0.98px; position: absolute; background: #001E31"></div>
                    </div>
                </div>
                <div style="width: 40.24px; height: 40.40px; left: 228.08px; top: 302.40px; position: absolute">
                    <div style="width: 40.24px; height: 31.19px; left: -0px; top: 9.21px; position: absolute">
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.65px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.65px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 40.24px; height: 31.20px; left: 0px; top: 0px; position: absolute">
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.24px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                    </div>
                    <div style="width: 16.50px; height: 9.53px; left: 11.87px; top: 6.85px; position: absolute; background: #EBF2F9"></div>
                </div>
                <div style="width: 40.24px; height: 49.61px; left: 21.07px; top: 255.98px; position: absolute">
                    <div style="width: 40.24px; height: 31.20px; left: -0px; top: 18.41px; position: absolute">
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.24px; left: 0px; top: 0px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 40.24px; height: 31.20px; left: -0px; top: 9.21px; position: absolute">
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                        <div style="width: 31.88px; height: 18.40px; left: 4.19px; top: 2.42px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 31.88px; height: 26.36px; left: 4.19px; top: 0px; position: absolute">
                        <div style="width: 15.99px; height: 17.19px; left: 15.89px; top: 9.17px; position: absolute; background: #004D96"></div>
                        <div style="width: 15.89px; height: 17.14px; left: 0px; top: 9.22px; position: absolute; background: #004D96"></div>
                        <div style="width: 31.88px; height: 18.40px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                    </div>
                    <div style="width: 13.07px; height: 7.55px; left: 13.59px; top: 5.45px; position: absolute; background: #EBF2F9"></div>
                </div>
                <div style="width: 238.13px; height: 107.24px; left: 53.91px; top: 225.43px; position: absolute">
                    <div style="width: 32.50px; height: 19.13px; left: -0px; top: 75.39px; position: absolute">
                        <div style="width: 7.60px; height: 4.74px; left: 0px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 12.46px; top: 7.19px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.75px; left: 24.91px; top: 14.38px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 94.79px; height: 55.09px; left: 136.80px; top: -0px; position: absolute">
                        <div style="width: 7.60px; height: 4.74px; left: 0px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 12.46px; top: 7.19px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 24.92px; top: 14.38px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 74.75px; top: 43.15px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.75px; left: 87.20px; top: 50.34px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 20.05px; height: 11.93px; left: 151.77px; top: 80.90px; position: absolute">
                        <div style="width: 7.60px; height: 4.74px; left: 0px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 12.46px; top: 7.19px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 20.05px; height: 11.93px; left: 96.95px; top: 49.26px; position: absolute">
                        <div style="width: 7.60px; height: 4.74px; left: 0px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 12.46px; top: 7.19px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 7.60px; height: 4.74px; left: 7.68px; top: 37.57px; position: absolute; background: #0E5A90"></div>
                    <div style="width: 44.97px; height: 26.32px; left: 75.93px; top: 77.78px; position: absolute">
                        <div style="width: 7.60px; height: 4.74px; left: 37.37px; top: -0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 24.92px; top: 7.19px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 12.46px; top: 14.38px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: -0px; top: 21.57px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 94.98px; height: 1.58px; left: 76.61px; top: 105.67px; position: absolute">
                        <div style="width: 8.67px; height: 1.29px; left: 0px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 14.38px; top: 0.05px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 28.77px; top: 0.10px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 43.15px; top: 0.14px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 57.53px; top: 0.20px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 71.91px; top: 0.24px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 86.30px; top: 0.29px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 66.21px; height: 1.49px; left: 165.34px; top: 71.38px; position: absolute">
                        <div style="width: 8.67px; height: 1.29px; left: 0px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 14.38px; top: 0.05px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 28.77px; top: 0.10px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 43.16px; top: 0.14px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 57.54px; top: 0.20px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 109.36px; height: 1.63px; left: 4.23px; top: 71.04px; position: absolute">
                        <div style="width: 8.67px; height: 1.29px; left: 0px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 14.38px; top: 0.05px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 28.77px; top: 0.10px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 43.15px; top: 0.14px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 57.54px; top: 0.20px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 71.92px; top: 0.24px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 86.30px; top: 0.29px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 8.67px; height: 1.29px; left: 100.69px; top: 0.34px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 20.06px; height: 11.94px; left: 218.07px; top: 81.96px; position: absolute">
                        <div style="width: 7.60px; height: 4.74px; left: 12.46px; top: -0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: 0px; top: 7.20px; position: absolute; background: #0E5A90"></div>
                    </div>
                    <div style="width: 20.06px; height: 11.93px; left: 161.55px; top: 45.97px; position: absolute">
                        <div style="width: 7.60px; height: 4.74px; left: 12.46px; top: 0px; position: absolute; background: #0E5A90"></div>
                        <div style="width: 7.60px; height: 4.74px; left: -0px; top: 7.19px; position: absolute; background: #0E5A90"></div>
                    </div>
                </div>
                <div style="width: 40.23px; height: 49.61px; left: 288.42px; top: 260.35px; position: absolute">
                    <div style="width: 40.23px; height: 31.19px; left: 0px; top: 18.42px; position: absolute">
                        <div style="width: 20.17px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.53px; left: 0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.23px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 40.23px; height: 31.19px; left: 0px; top: 9.21px; position: absolute">
                        <div style="width: 20.17px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.06px; height: 19.54px; left: 0px; top: 11.65px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.23px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                        <div style="width: 31.88px; height: 18.40px; left: 4.18px; top: 2.41px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 31.88px; height: 26.37px; left: 4.18px; top: -0px; position: absolute">
                        <div style="width: 15.99px; height: 17.19px; left: 15.89px; top: 9.18px; position: absolute; background: #004D96"></div>
                        <div style="width: 15.89px; height: 17.14px; left: 0px; top: 9.23px; position: absolute; background: #004D96"></div>
                        <div style="width: 31.88px; height: 18.40px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                    </div>
                    <div style="width: 13.07px; height: 7.55px; left: 13.58px; top: 5.46px; position: absolute; background: #EBF2F9"></div>
                </div>
                <div style="width: 40.24px; height: 40.40px; left: 228.08px; top: 234.26px; position: absolute">
                    <div style="width: 40.24px; height: 31.20px; left: -0px; top: 9.21px; position: absolute">
                        <div style="width: 20.06px; height: 19.54px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #2B93FA"></div>
                    </div>
                    <div style="width: 40.24px; height: 31.19px; left: 0px; top: 0px; position: absolute">
                        <div style="width: 20.06px; height: 19.53px; left: -0px; top: 11.66px; position: absolute; background: #004D96"></div>
                        <div style="width: 20.18px; height: 19.61px; left: 20.06px; top: 11.58px; position: absolute; background: #004D96"></div>
                        <div style="width: 40.24px; height: 23.23px; left: 0px; top: 0px; position: absolute; background: #072646"></div>
                    </div>
                    <div style="width: 16.50px; height: 9.53px; left: 11.87px; top: 6.85px; position: absolute; background: #EBF2F9"></div>
                </div>
                <div style="width: 80.05px; height: 113.18px; left: 0px; top: 86.78px; position: absolute">
                    <div style="width: 72.39px; height: 110.99px; left: 0px; top: 2.19px; position: absolute">
                        <div style="width: 66.54px; height: 63.03px; left: 3.25px; top: -0px; position: absolute">
                            <div style="width: 66.54px; height: 44.14px; left: -0px; top: 11.60px; position: absolute; background: #FF7200"></div>
                            <div style="width: 12.15px; height: 17.45px; left: 6.95px; top: 45.58px; position: absolute; background: #004D96"></div>
                            <div style="width: 66.54px; height: 50.02px; left: 0px; top: 0px; position: absolute; background: #E06800"></div>
                        </div>
                        <div style="width: 38.65px; height: 23.31px; left: 33.75px; top: 87.10px; position: absolute; background: #C4D3ED"></div>
                        <div style="width: 38.65px; height: 23.31px; left: 0px; top: 87.68px; position: absolute; background: #C4D3ED"></div>
                        <div style="width: 66.54px; height: 83.14px; left: 3.25px; top: 11.60px; position: absolute">
                            <div style="width: 66.54px; height: 83.14px; left: 0px; top: 0px; position: absolute; background: #FFA100"></div>
                            <div style="width: 66.54px; height: 42.44px; left: -0px; top: 40.71px; position: absolute; background: #FFAE00"></div>
                        </div>
                    </div>
                    <div style="width: 69.85px; height: 100.77px; left: 10.20px; top: 0px; position: absolute">
                        <div style="width: 37.96px; height: 23.75px; left: 31.88px; top: 76.50px; position: absolute; background: #004D96"></div>
                        <div style="width: 10.03px; height: 43.02px; left: 14.93px; top: 21.09px; position: absolute; background: #004D96"></div>
                        <div style="width: 6.36px; height: 5.26px; left: -0px; top: 49.69px; position: absolute; background: #004D96"></div>
                        <div style="width: 46.71px; height: 100.77px; left: 18.41px; top: 0px; position: absolute; background: #EBF2F9"></div>
                        <div style="width: 14.85px; height: 23.21px; left: 1.69px; top: 41.48px; position: absolute; background: #072646"></div>
                    </div>
                    <div style="width: 26.97px; height: 44.75px; left: 40.67px; top: 24.59px; position: absolute">
                        <div style="width: 19.64px; height: 12.94px; left: 3.67px; top: 0px; position: absolute; background: #CFD8DB"></div>
                        <div style="width: 26.97px; height: 17.17px; left: -0px; top: 10.32px; position: absolute; background: #CFD8DB"></div>
                        <div style="width: 26.97px; height: 17.17px; left: -0px; top: 21.83px; position: absolute; background: #CFD8DB"></div>
                        <div style="width: 21.72px; height: 14.14px; left: -0px; top: 19.11px; position: absolute; background: #CFD8DB"></div>
                        <div style="width: 9.52px; height: 7.10px; left: -0px; top: 37.65px; position: absolute; background: #CFD8DB"></div>
                    </div>
                    <div style="width: 16.72px; height: 20.14px; left: 52.47px; top: 60.63px; position: absolute">
                        <div style="width: 16.72px; height: 20.14px; left: 0px; top: 0px; position: absolute">
                            <div style="width: 14.58px; height: 19.64px; left: 0px; top: 0px; position: absolute; background: #00A658"></div>
                            <div style="width: 14.56px; height: 18.89px; left: 2.17px; top: 1.25px; position: absolute; background: #00D158"></div>
                        </div>
                        <div style="width: 9.86px; height: 10.67px; left: 5.10px; top: 5.57px; position: absolute">
                            <div style="width: 0.81px; height: 0.48px; left: 2.36px; top: 10.09px; position: absolute; background: #C6C0D0"></div>
                            <div style="width: 2.47px; height: 1.46px; left: 7.02px; top: 0px; position: absolute; background: #D3E1FC"></div>
                            <div style="width: 4.13px; height: 5.92px; left: 3.62px; top: 1.04px; position: absolute; background: #D3E1FC"></div>
                            <div style="width: 2.79px; height: 2.09px; left: 0.29px; top: 8.42px; position: absolute; background: #D3E1FC"></div>
                            <div style="width: 1.63px; height: 0.59px; left: 1.26px; top: 5.28px; position: absolute; background: #D3E1FC"></div>
                            <div style="width: 1.98px; height: 3.37px; left: 0px; top: 5.47px; position: absolute; background: #D3E1FC"></div>
                            <div style="width: 9.14px; height: 10.25px; left: 0.72px; top: 0.42px; position: absolute; background: white"></div>
                        </div>
                    </div>
                    <div style="width: 0.15px; height: 0.09px; left: 24.98px; top: 64.12px; position: absolute; background: #EBF2F9"></div>
                </div>
            </div>
        </div>
    </div>
    <div style="width: 472px; height: 120px; left: 197px; top: 328px; position: absolute; justify-content: center; align-items: center; display: inline-flex">
        <div style="width: 472px; text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 500; word-wrap: break-word">Daewoo Express is the first and the biggest foreign investment company with an advanced and organized transport system in Pakistan. It is the only transport company tho have a nationwide network with various international trade links.</div>
    </div>
</div>

    <!--**********************************
	Scripts
***********************************-->
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
    <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="js/deznav-init.js"></script>
    <script src="js/plugins-init/sweetalert-init.js"></script>

    <script src="vendor/sweetalert2/dist/sweetalert2.min.js"></script>

    <script src="js/custom.js"></script>

    <script type="text/javascript">
        function BindProjectList() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/GetProjectForDropDown",
                dataType: 'json',
                success: function (data) {
                    let Success = data.Success;
                    let Response = data.Response;
                    let DataList = data.Data;
                    if (Success) {
                        $("#ddlProjects").append('<option value="-1">Select</option>')
                        $.each(DataList, function (i, projects) {
                            $("#ddlProjects").append('<option value="' + projects.PROJECTID + '">' + projects.NAME + '</option>');
                        });
                    }
                }
            });
        }
        function Login() {
            if ($("#txtEmail").val() == "admin") {
                $.ajax({
                    type: "POST",
                    contentType: 'application/json; charset=utf-8',
                    url: "api/users/Login",
                    data: PostDataJson(),
                    dataType: 'json',
                    success: function (data) {
                        let list = data.Data;
                        if (data.Success) {
                            LoadUserPermissions(list.Session_USERROLEID, list.Session_USERID, list.Session_PROJECTID);
                        }
                        else {
                            sweetAlert("", "Invalid Credentials", "error");
                        }
                    }
                });
            }
            else {
                if ($("#ddlProjects").val() == -1) {
                    sweetAlert("", "Please select project", "error");
                }
                else {
                    $.ajax({
                        type: "POST",
                        contentType: 'application/json; charset=utf-8',
                        url: "api/users/Login",
                        data: PostDataJson(),
                        dataType: 'json',
                        success: function (data) {
                            let list = data.Data;
                            if (data.Success) {
                                LoadUserPermissions(list.Session_USERROLEID, list.Session_USERID, list.Session_PROJECTID);
                            }
                            else {
                                sweetAlert("", "Invalid Credentials", "error");
                            }
                        }
                    });
                }
            }
        }
        function LoadUserPermissions(UserRoleId, user_id, project_id) {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/users/LoadUserPermissions",
                dataType: 'json',
                success: function (data) {
                    if (project_id == 61) { //WIMS-WORKSHOP
                        window.location.href = 'WIMS_Workshop_Dashboard.aspx?ProjectType=' + '' + '&Mode=' + '';
                    }
                    else if (project_id == 26) { //WIMS-ADMIN
                        window.location.href = 'WIMS_Admin_Dashboard.aspx?ProjectType=' + '' + '&Mode=' + '';
                    }
                    else if (project_id == 81) { //ECS
                        window.location.href = 'ECS_Dashboard.aspx?ProjectType=' + '' + '&Mode=' + '';
                    }
                    else { //Admin 
                        window.location.href = 'Projects.aspx';
                    }
                }
            });
        }
        function PostDataJson() {
            return JSON.stringify({
                "EMAIL": $("#txtEmail").val(),
                "PASSOWRD": $("#dz-password").val(),
                "PROJECTID": $("#ddlProjects").val()
            });
        }
        window.onload = BindProjectList;
    </script>

</body>
</html>