local F, C = unpack(select(2, ...))
-- �������
C.modules['Blizzard_TrainerUI'] = function()
	if AuroraConfig.TrainerUI then
	-- [[ ������ ������� ]]
		local AllTrainerUIStripTextures = {'ClassTrainerFrame'}
		for i = 1, #AllTrainerUIStripTextures do
			F.StripTextures(_G[AllTrainerUIStripTextures[i]], true)
		end
	-- [[ ���������� ������ ]]
		local AllTrainerUIDropDowns = {'ClassTrainerFrameFilterDropDown'}
		for i = 1, #AllTrainerUIDropDowns do
			F.ReskinDropDown(_G[AllTrainerUIDropDowns[i]])
		end
	-- [[ ������ ]]
		local AllTrainerUIButtons = {'ClassTrainerTrainButton', 'ClassTrainerCancelButton'}
		for i = 1, #AllTrainerUIButtons do
			F.Reskin(_G[AllTrainerUIButtons[i]])
		end
		F.StripTextures(ClassTrainerExpandButtonFrame)
		
		F.SetBD(ClassTrainerFrame, 10, -12, -31, 76)
		F.ReskinClose(ClassTrainerFrameCloseButton, 'TOPRIGHT', ClassTrainerFrame, 'TOPRIGHT', -35, -16)
	end
end