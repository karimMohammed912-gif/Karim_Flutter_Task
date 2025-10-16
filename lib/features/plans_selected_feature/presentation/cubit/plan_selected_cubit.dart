import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/data/models/plan_model.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/data/repo/plan_repository.dart';

sealed class PlanSelectedState {}

class PlanSelectedInitial extends PlanSelectedState {}

class PlanSelectedLoading extends PlanSelectedState {}

class PlanSelectedLoaded extends PlanSelectedState {
  final List<PlanModel> plans;
  final int selectedPlanIndex;
  
  PlanSelectedLoaded({
    required this.plans,
    this.selectedPlanIndex = 1,
  });
}

class PlanSelectedError extends PlanSelectedState {
  final String message;
  PlanSelectedError(this.message);
}

class PlanSelectedCubit extends Cubit<PlanSelectedState> {
  final PlanRepository _planRepository;
  
  PlanSelectedCubit({required PlanRepository planRepository})
      : _planRepository = planRepository,
        super(PlanSelectedInitial());

  Future<void> loadPlans() async {
    emit(PlanSelectedLoading());
    try {
      await _planRepository.initializeSamplePlans();
      final plans = await _planRepository.getAllPlans();
      emit(PlanSelectedLoaded(plans: plans));
    } catch (e) {
      emit(PlanSelectedError(e.toString()));
    }
  }

  Future<void> addPlan(PlanModel plan) async {
    try {
      await _planRepository.insertPlan(plan);
      loadPlans();
    } catch (e) {
      emit(PlanSelectedError(e.toString()));
    }
  }

  Future<void> selectPlan(int index) async {
    final currentState = state;
    if (currentState is PlanSelectedLoaded) {
      try {
        // Update selection in database
        for (int i = 0; i < currentState.plans.length; i++) {
          await _planRepository.updatePlanSelection(
            i + 1, // Using index + 1 as ID
            i == index,
          );
        }
        
        // Update local state
        final updatedPlans = currentState.plans.asMap().entries.map((entry) {
          final planIndex = entry.key;
          final plan = entry.value;
          return PlanModel(
            title: plan.title,
            price: plan.price,
            features: plan.features,
            isSelected: planIndex == index,
            is48Days: plan.is48Days,
          );
        }).toList();
        
        emit(PlanSelectedLoaded(
          plans: updatedPlans,
          selectedPlanIndex: index,
        ));
      } catch (e) {
        emit(PlanSelectedError(e.toString()));
      }
    }
  }
}
