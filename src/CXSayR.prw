#INCLUDE "Protheus.ch"
#INCLUDE "RWMake.ch"
#INCLUDE "COLORS.CH"
#Include "ParmType.ch"
#Include "CXInclude.ch"

//�����������������������������������������������������������������������������
//�����������������������������������������������������������������������������
//�������������������������������������������������������������������������ͻ��
//���Programa  � CXSayR   � Autor � Cirilo Rocha        � Data � 27/01/2012 ���
//�������������������������������������������������������������������������͹��
//���Descricao � Funcao para imprimir um texto em objeto grafico alinhado a ���
//���          � direita                                                    ���
//���          �                                                            ���
//���          �                                                            ���
//���          �                                                            ���
//�������������������������������������������������������������������������͹��
//���   DATA   � Programador   � Manutencao Efetuada                        ���
//�������������������������������������������������������������������������͹��
//��� 08/02/12 � Cirilo Rocha  � Pequena melhoria na obtencao do tamanho do ���
//���          �               � texto usando a funcao CXTamTxt             ���
//��� 03/06/15 � Cirilo Rocha  � Melhoria no tramento do novo objeto printer���
//���          �               � (FWMSPrinter)                              ���
//���          �               �                                            ���
//���          �               �                                            ���
//�������������������������������������������������������������������������ͼ��
//�����������������������������������������������������������������������������
//�����������������������������������������������������������������������������  
User Function CXSayR(nPosX,nPosY,cTexto,oFonte,oReport)

	Local	nAlignVert	:= 1 //Superior
	Local nAlignHorz	:= 1 //Direita
	Local nAdjust_Say	:= 30
	Local nPosTxt
	Local nRow
	Local nCol
	Local nWidth
	Local nHeigth

	ParamType 0	VAR nPosX  		AS Numeric
	ParamType 1	VAR nPosY  		AS Numeric
	ParamType 2	VAR cTexto  	AS Character
	ParamType 3	VAR oFonte 		AS Object
	ParamType 4	VAR oReport		AS Object

	cTexto	:= AllTrim(cTexto) //Remove espacos a esquerda

	//Nova classe FWMSPrinter
	If Type('oReport:lAdjustToLegacy') == 'L'
		nRow			:= nPosX
		nCol			:= 0
		nWidth		:= nPosY
		nHeigth		:= 100
		
		If Type('oReport:nAdjust_Say') == 'N'
			nAdjust_Say	:= oReport:nAdjust_Say  //Ajuste da impressao do say (padrao totvs)
		Else
			//Ajusta as proporcoes para o FWMsPrinter
			If !oReport:lAdjustToLegacy
				nAdjust_Say 	/= oReport:nFactorVert
			EndIf
		EndIf
	
		oReport:SayAlign (nRow-nAdjust_Say,nCol,cTexto,oFonte,nWidth,nHeigth, /*nClrText*/, nAlignHorz, nAlignVert ) 
	//Objeto antigo TMSPrinter
	Else
		nPosTxt	:= nPosY - U_CXTamTxt(cTexto,@oFonte,@oReport)
		oReport:Say(nPosX,nPosTxt,cTexto,oFonte)
		
//		oReport:Say ( nPosX, 000, cTexto, oFonte, nPosY, /*nClrText*/, /*uParam7*/, nAlignHorz) //O alinhamento padrao nao funciona
	EndIf
		
Return