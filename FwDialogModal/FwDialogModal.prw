/*
{Protheus.doc} User Function FWDlgModal

Rotina exemplo de como construir e usar a classe FwDialogModal.

@type  User Function

@author SIGAMDI.net

@since 14/09/2020

@see https://tdn.totvs.com/display/framework/FwDialogModal
*/

#Include 'Protheus.ch'

User Function FWDlgModal()
Local bConfirm
Local bSair 
    
Local oDialog 

bConfirm := {|| MsgInfo('Insira seu processamento aqui','Processando') }

bSair    := {|| Iif(MsgYesNo( 'Você tem certeza que deseja sair da rotina? ',;
'Sair da rotina'),(oDialog:DeActivate()),NIL) }

// Método responsável por criar a janela e montar os paineis.
oDialog := FWDialogModal():New()

// Métodos para configurar o uso da classe.
oDialog:SetBackground( .T. ) 
oDialog:SetTitle( 'SIGAMDI.net - OFICINA DE PROGRAMAÇÃO' )
oDialog:SetSize( 240, 480 )
oDialog:EnableFormBar( .T. )
oDialog:SetCloseButton( .F. )
oDialog:SetEscClose( .F. )
oDialog:CreateDialog()
oDialog:CreateFormBar()
oDialog:AddButton( 'Confirmar', bConfirm, 'Confirmar', , .T., .F., .T., )
oDialog:AddButton( 'Sair' , bSair   , 'Sair' , , .T., .F., .T., )

// Capturar o objeto do FwDialogModal para alocar outros objetos se necessário.
oPanel := oDialog:GetPanelMain()

oDialog:Activate()

Return
