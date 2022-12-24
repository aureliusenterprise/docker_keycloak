<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="field">
                    <label class="label" for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>        
                    <p class="control has-icons-left is-expanded">
                        <#if usernameEditDisabled??>
                            <input class="input" id="username" name="username" value="${(login.username!'')}" type="text" disabled />
                        <#else>
                            <input class="input" id="username" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                        </#if>
                        <span class="icon is-small is-left">
                            <i class="fas fa-user"></i>
                        </span>
                    </p>                   
                </div>
                <div class="field">
                    <label class="label" for="password">${msg("password")}</label>
                    <p class="control has-icons-left is-expanded">
                        <input class="input" id="password" name="password" type="password" autocomplete="off" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-key"></i>
                        </span>
                    </p>                  
                </div>
                <hr class="hr">
                <div id="kc-form-options">
                    <#if realm.rememberMe && !usernameEditDisabled??>
                        <div class="field" style="margin-bottom: 0.75rem">
                            <#if login.rememberMe??>
                                <input class="is-checkradio" id="rememberMe" name="rememberMe" type="checkbox" checked> 
                            <#else>
                                <input class="is-checkradio" id="rememberMe" name="rememberMe" type="checkbox">
                            </#if>
                            <label for="rememberMe">
                                ${msg("rememberMe")}
                            </label>
                        </div>
                    </#if>
                    </div>
                </div>
                <div id="kc-form-buttons" class="field">
                <p class="control">
                    <input class="button is-primary is-fullwidth is-large" tabindex="4" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </p>
            </form>
            <hr class="hr">
            <div class="field">
                <a href="${url.registrationUrl}">Register a new account</a>
            </div>            
            <#if realm.resetPasswordAllowed>
                <div class="field">
                    <a class="level-item" href="${url.loginResetCredentialsUrl}">I forgot my password</a>
                <div class="field">
            </#if>
        </#if>
        </div>
      </div>
    </#if>

</@layout.registrationLayout>
