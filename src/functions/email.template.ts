import nodemailer from 'nodemailer';
import logger from '../config/logger';

const clientUrl = 'https://cpclibrary.online/auth?reset=';

const createTransporter = () => {
  const transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    auth: {
      user: 'team.cpc.library@gmail.com',
      pass: 'nusbfkdyrjbdkfat '
    },
    tls: {
      ciphers: 'SSLv3'
    },
    debug: true,
  });

  return transporter;
}

export const emailTemplate = async (auth_token: string, email_to: string) => {
  try {
    const transporter = createTransporter();

    const info = await transporter.sendMail({
      from: "team.cpc.library@gmail.com",
      to: `${email_to}`,
      subject: "Password Reset Request",
      text: "Password reset request please click the link",
      html: `<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="x-apple-disable-message-reformatting">
        <meta name="format-detection" content="telephone=no,address=no,email=no,date=no,url=no">

        <meta name="color-scheme" content="light">
        <meta name="supported-color-schemes" content="light">

        
        <!--[if !mso]><!-->
          
          <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&display=swap">
          <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&display=swap">

          <style type="text/css">
          // TODO: fix me!
            @import url(https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&display=swap);
        </style>
        
        <!--<![endif]-->

        <!--[if mso]>
          <style>
              // TODO: fix me!
              * {
                  font-family: sans-serif !important;
              }
          </style>
        <![endif]-->
    
        
        <!-- NOTE: the title is processed in the backend during the campaign dispatch -->
        <title></title>

        <!--[if gte mso 9]>
        <xml>
            <o:OfficeDocumentSettings>
                <o:AllowPNG/>
                <o:PixelsPerInch>96</o:PixelsPerInch>
            </o:OfficeDocumentSettings>
        </xml>
        <![endif]-->
        
    <style>
        :root {
            color-scheme: light;
            supported-color-schemes: light;
        }

        html,
        body {
            margin: 0 auto !important;
            padding: 0 !important;
            height: 100% !important;
            width: 100% !important;

            overflow-wrap: break-word;
            -ms-word-break: break-all;
            -ms-word-break: break-word;
            word-break: break-all;
            word-break: break-word;
        }


        
  direction: undefined;
  center,
  #body_table{
    
  }

  .paragraph {
    font-size: 14px;
    font-family: Verdana, sans-serif;
    color: #38332d;
  }

  ul, ol {
    padding: 0;
    margin-top: 0;
    margin-bottom: 0;
  }

  li {
    margin-bottom: 0;
  }
 
  .list-block-list-outside-left li {
    margin-left: 20px;
  }

  .list-block-list-outside-right li {
    margin-right: 20px;
  }
  
  .heading1 {
    font-weight: 400;
    font-size: 48px;
    font-family: Merriweather, serif;
    color: #ffffff;
  }

  .heading2 {
    font-weight: 400;
    font-size: 34px;
    font-family: Merriweather, serif;
    color: #38332d;
  }

  .heading3 {
    font-weight: 400;
    font-size: 24px;
    font-family: Merriweather, serif;
    color: #ffffff;
  }
  
  a {
    color: #764b17;
    text-decoration: none;
  }
  


        * {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }

        div[style*="margin: 16px 0"] {
            margin: 0 !important;
        }

        #MessageViewBody,
        #MessageWebViewDiv {
            width: 100% !important;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
            mso-table-lspace: 0pt !important;
            mso-table-rspace: 0pt !important;
        }
        table:not(.button-table) {
            border-spacing: 0 !important;
            border-collapse: collapse !important;
            table-layout: fixed !important;
            margin: 0 auto !important;
        }

        th {
            font-weight: normal;
        }

        tr td p {
            margin: 0;
        }

        img {
            -ms-interpolation-mode: bicubic;
        }

        a[x-apple-data-detectors],

        .unstyle-auto-detected-links a,
        .aBn {
            border-bottom: 0 !important;
            cursor: default !important;
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        .im {
            color: inherit !important;
        }

        .a6S {
            display: none !important;
            opacity: 0.01 !important;
        }

        img.g-img+div {
            display: none !important;
        }

        @media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
            u~div .contentMainTable {
                min-width: 320px !important;
            }
        }

        @media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
            u~div .contentMainTable {
                min-width: 375px !important;
            }
        }

        @media only screen and (min-device-width: 414px) {
            u~div .contentMainTable {
                min-width: 414px !important;
            }
        }
    </style>

    <style>
        @media only screen and (max-device-width: 600px) {
            .contentMainTable {
                width: 100% !important;
                margin: auto !important;
            }
            .single-column {
                width: 100% !important;
                margin: auto !important;
            }
            .multi-column {
                width: 100% !important;
                margin: auto !important;
            }
            .imageBlockWrapper {
                width: 100% !important;
                margin: auto !important;
            }
        }
        @media only screen and (max-width: 600px) {
            .contentMainTable {
                width: 100% !important;
                margin: auto !important;
            }
            .single-column {
                width: 100% !important;
                margin: auto !important;
            }
            .multi-column {
                width: 100% !important;
                margin: auto !important;
            }
            .imageBlockWrapper {
                width: 100% !important;
                margin: auto !important;
            }
        }
    </style>
    <style>.7516697f-c8fe-435d-bfef-1a2f77de65d1-zYLr21VTyahwO5V_1kCCF { color: #000000; } </style>
    
<!--[if mso | IE]>
    <style>
        .list-block-outlook-outside-left {
            margin-left: -18px;
        }
    
        .list-block-outlook-outside-right {
            margin-right: -18px;
        }

    </style>
<![endif]-->


    </head>

    <body width="100%" style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #eeeff2;">
        <center role="article" aria-roledescription="email" lang="en" style="width: 100%; background-color: #eeeff2;">
            <!--[if mso | IE]>
            <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%" id="body_table" style="background-color: #eeeff2;">
            <tbody>    
                <tr>
                    <td>
                    <![endif]-->
                        <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" style="margin: auto;" class="contentMainTable">
                            <tr class="wp-block-editor-spacerblock-v1"><td style="background-color:#EEEFF2;line-height:50px;font-size:50px;width:100%;min-width:100%">&nbsp;</td></tr><tr class="wp-block-editor-imageblock-v1"><td style="background-color:#FFF;padding-top:25px;padding-bottom:25px;padding-left:25px;padding-right:25px" align="center"><table align="center" width="137.5" class="imageBlockWrapper" style="width:137.5px" role="presentation"><tbody><tr><td style="padding:0"><img src="https://cpclibrary.online/assets/librarylogo.ef245914.png" width="137.5" height="" alt="" style="border-radius:300px;display:block;height:auto;width:100%;max-width:100%;border:0" class="g-img"></td></tr></tbody></table></td></tr><tr class="wp-block-editor-dividerblock-v1" align="center" valign="top"><td style="padding-top:20px;padding-bottom:20px;padding-left:20px;padding-right:20px;background-color:#ffffff"><div style="background:#0164BA;font-size:1px;line-height:1px;border:0">&nbsp;</div></td></tr><tr class="wp-block-editor-headingblock-v1"><td valign="top" style="background-color:#FFF;display:block;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;text-align:center"><p style="font-family:Merriweather, serif;text-align:center;line-height:39.10px;font-size:34px;background-color:#FFF;color:#38332d;margin:0;word-break:normal" class="heading2">Reset Password</p></td></tr><tr class="wp-block-editor-paragraphblock-v1"><td valign="top" style="padding:25px 25px 25px 25px;background-color:#FFF"><p class="paragraph" style="font-family:Verdana, sans-serif;text-align:left;line-height:1.5;font-size:14px;margin:0;color:#38332d;word-break:normal">Dear ${email_to},<br><br>We noticed that you've requested a password reset for your CPC Library account. No worries – we're here to help you get back to accessing valuable resources. Click the button below to reset your password securely.<br></p></td></tr><tr class="wp-block-editor-buttonblock-v1" align="center"><td style="background-color:#fff;padding-top:20px;padding-right:20px;padding-bottom:20px;padding-left:20px;width:100%" valign="top"><table role="presentation" cellspacing="0" cellpadding="0" class="button-table"><tbody><tr><td valign="top" class="button-td button-td-primary" style="cursor:pointer;border:none;border-radius:0px;background-color:#2382D6;font-size:16px;font-family:Open Sans, sans-serif;width:fit-content;color:#ffffff"><a style="color:#ffffff" href="${clientUrl+auth_token}" target="_blank">
    <table role="presentation">
    <tbody><tr>
      <!-- Top padding -->
      <td valign="top" colspan="3" height="16" style="height: 16px; line-height: 1px; padding: 0;">
        &nbsp;
      </td>
    </tr>
    <tr>
      <!-- Left padding -->
      <td valign="top" width="32" style="width: 32px; line-height: 1px; padding: 0;">
        &nbsp;
      </td>
      <!-- Content -->
      <td valign="top" style="
        cursor: pointer; border: none; border-radius: 0px; background-color: #2382D6; font-size: 16; font-family: Open Sans, sans-serif; width: fit-content; letter-spacing: undefined;
          color: #ffffff;
          display: block;
          padding: 0;
        ">
        Reset Password
      </td>
      <!-- Right padding -->
      <td valign="top" width="32" style="width: 32px; line-height: 1px; padding: 0;">
        &nbsp;
      </td>
    </tr>
    <!-- Bottom padding -->
    <tr>
      <td valign="top" colspan="3" height="16" style="height: 16px; line-height: 1px; padding: 0;">
        &nbsp;
      </td>
    </tr>
  </tbody></table>
    </a></td></tr></tbody></table></td></tr><tr><td style="padding-top:20px;padding-left:0;padding-right:0;padding-bottom:20px;background-color:#fafafa"><table role="presentation" class="multi-column" style="width:600px;border-collapse:collapse !important" cellpadding="0" cellspacing="0"><tbody><tr style="padding-top:20px;padding-left:0;padding-right:0;padding-bottom:20px" class="wp-block-editor-onecolumnsblock-v1"><td style="width:600px;float:left" class="wp-block-editor-column single-column"><table role="presentation" align="left" border="0" class="single-column" width="600" style="width:600px;float:left;border-collapse:collapse !important" cellspacing="0" cellpadding="0"><tbody><tr class="wp-block-editor-paragraphblock-v1"><td valign="top" style="padding:25px 25px 25px 25px;background-color:#fafafa"><p class="paragraph" style="font-family:Verdana, sans-serif;line-height:1.5;font-size:14px;margin:0;color:#38332d;letter-spacing:0;word-break:normal">If the button doesn't work, you can also copy and paste the following link into your browser: click this link <a style="color:#1b80e2; text-decoration: underline" href="${clientUrl+auth_token}" target="_blank">reset password</a><br><br>Please note that this link is valid for a limited time for security reasons.<br>If you didn't request this password reset, or if you have any concerns, please contact our support team immediately at <a href="mailto:team.cpc.library@gmail.com" style="color:#1b80e2 !important"><span style="color:#1b80e2"><u>team.cpc.library@gmail.com</u></span></a> or <u><span style="color:#1B80E2;text-decoration:underline;">(032) 494 1410</span></u>.<br>Thank you for being a part of the CPC Library community.<br>Best regards,<br><br>Descartin, Lance Phillip Senior Developer, CPC Library (+63)987 4561 236.</p></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td valign="top" align="center" style="padding:32px 32px 32px 32px;background-color:#eeeff2"><p aria-label="Unsubscribe" class="paragraph" style="font-family:Verdana, sans-serif;text-align:center;line-height:1.5;font-size:11px;margin:0;color:#38332d;word-break:normal">If you no longer wish to receive mail from us, you can <span style="color:#000000"><a class="7516697f-c8fe-435d-bfef-1a2f77de65d1-zYLr21VTyahwO5V_1kCCF" href="{unsubscribe}" target="_blank" data-type="mergefield" data-id="7516697f-c8fe-435d-bfef-1a2f77de65d1-zYLr21VTyahwO5V_1kCCF" data-filename="" style="color:#000000" data-mergefield-value="unsubscribe" data-mergefield-input-value=""><strong><u>unsubscribe</u></strong></a></span>.<br>{team.cpc.library@gmail.com}</p></td></tr>
                        </table>
                    <!--[if mso | IE]>
                    </td>
                </tr>
            </tbody>
            </table>
            <![endif]-->
        </center>
    </body>
</html>`,
    });

    console.info("Message sent: %s", info.messageId);
    return info.messageId;
  } catch (error) {
    logger.error('Sending email error at email template:');
    console.error(error);
    return error;
  }
  return `
   `
}

